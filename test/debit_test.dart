import 'package:contability/entities/credit_card.dart';
import 'package:contability/entities/debt.dart';
import 'package:contability/main_stances.dart';
import 'package:contability/modules/home_/store/reduce/debit_register_store.dart';

import 'package:contability/modules/home_/store/states/loading_state.dart';
import 'package:contability/modules/home_/store/states/sucess_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

void main() {
  group('crud', () {
    SharedPreferences.setMockInitialValues({}); //set values here
    late DebitRegisterStore debitRegisterStore;
    setUpAll(() async {
      await MainStances.init();
      debitRegisterStore = DebitRegisterStore(HomeLoadingRegisterState());
    });
    Debt mockDebit = Debt(
        name: 'name',
        id: 'id',
        installmentList: [],
        endDate: DateTime.now().add(const Duration(days: 60)),
        startDate: DateTime.now(),
        status: DebtStatus.actual);
    CreditCard mockCreditCard = CreditCard(
        id: '1',
        name: 'name',
        imgPath: 'img',
        balanceAvailableLimit: 1000,
        balanceTotalLimit: 2000,
        invoiceClosingDay: 24,
        debts: [mockDebit],
        lastPaid: DateTime.now());

    test('register', () async{
      expect(
          debitRegisterStore,
          emitValues([
            isA<HomeLoadingRegisterState>(),
            isA<HomeSuccessRegisterState>(),
            isA<HomeLoadingRegisterState>(),
            isA<HomeSuccessRegisterState>()
          ]));

      debitRegisterStore.registerEvent(mockCreditCard, mockDebit);
      debitRegisterStore.getCreditCardListEvent();
      expect(debitRegisterStore.creditCardList[0].debts[0].name,'name');
    });

    test('update', () {
      expect(
          debitRegisterStore,
          emitValues([
            isA<HomeLoadingRegisterState>(),
            isA<HomeSuccessRegisterState>()
          ]));
      mockDebit.name = 'last name updated';

      debitRegisterStore.updateEvent(mockCreditCard, mockDebit);
      expect((debitRegisterStore.value as HomeSuccessRegisterState).creditCardList[0].debts[0].name,'last name updated');
    });
    test('get', () {
      expect(
          debitRegisterStore,
          emitValues([
            isA<HomeLoadingRegisterState>(),
            isA<HomeSuccessRegisterState>()
          ]));
      debitRegisterStore.getCreditCardListEvent();
    });
    test('delete', () {
      expect(
          debitRegisterStore,
          emitValues([
            isA<HomeLoadingRegisterState>(),
            isA<HomeSuccessRegisterState>()
          ]));
      debitRegisterStore.deleteEvent(mockCreditCard, mockDebit);
      expect((debitRegisterStore.value as HomeSuccessRegisterState).creditCardList[0].debts.length,0);

    });
  });
}
