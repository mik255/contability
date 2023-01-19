




import 'package:contability/entities/credit_card.dart';
import 'package:contability/entities/debt.dart';
import 'package:contability/modules/debit_register/states/loading_state.dart';
import 'package:contability/modules/debit_register/states/sucess_state.dart';
import 'package:contability/modules/debit_register/store/debit_register_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  group('crud', (){
    SharedPreferences.setMockInitialValues({}); //set values here
    late SharedPreferences pref;
    late DebitRegisterStore debitRegisterStore;
    setUpAll(() async {
      pref = await SharedPreferences.getInstance();
      debitRegisterStore = DebitRegisterStore(DebitLoadingRegisterState(),pref);
    });
    test('register',()async{
      CreditCard mockCreditCard = CreditCard(
          id:'1',
          name: 'name',
          imgPath: 'img',
          balanceAvailableLimit: 1000,
          balanceTotalLimit: 2000,
          invoiceClosingDay: 24,
          debts: [],
          lastPaid: DateTime.now()
      );
      Debt mockDebit = Debt(name: 'name', id: 'id', installmentList: [],
          endDate: DateTime.now().add(const Duration(days: 60)),
          startDate: DateTime.now(), status: DebtStatus.actual);
      debitRegisterStore.register(mockCreditCard, mockDebit);

    });
    test('get',()async{
      debitRegisterStore.getCreditCardList();
      expect(debitRegisterStore.value, isA<DebitSuccessRegisterState>);
    });
  });

}