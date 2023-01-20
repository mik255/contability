import 'dart:convert';
import 'package:contability/main_stances.dart';
import 'package:contability/modules/home_/store/reduce/debit_register_store.dart';
import 'package:contability/modules/home_/store/states/loading_state.dart';
import 'package:contability/modules/home_/store/states/sucess_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

void main() {
  group('crud', () {
    SharedPreferences.setMockInitialValues({
      'creditCardList': [
        json.encode({
          "id": "1",
          "name": "name",
          "imgPath": "img",
          "balanceAvailableLimit": 1000.0,
          "balanceTotalLimit": 2000.0,
          "invoiceClosingDay": 24,
          "lastPaid": 1674176174363,
          "debts": [
            {
              "id": "id",
              "name": "name",
              "endDate": 1679360174362,
              "startDate": 1674176174362,
              "installmentList": [
                {
                  'id':'1',
                  'count':2,
                  'value':100,
                  'total':200,
                  'isPaid':true
                },
                {
                  'id':'1',
                  'count':1,
                  'value':100,
                  'total':100,
                  'isPaid':false
                }
              ],
              "status": "actual"
            }
          ],
          "status": "Status.open",
        })
      ]
    }); //set values here
    late DebitRegisterStore debitRegisterStore;
    setUpAll(() async {
      await MainStances.init();
      debitRegisterStore = DebitRegisterStore(HomeLoadingRegisterState());
    });

    test('get all', () async {
      expect(
          debitRegisterStore,
          emitValues([
            isA<HomeLoadingRegisterState>(),
            isA<HomeSuccessRegisterState>(),
          ]));

      debitRegisterStore.getCreditCardListEvent();
      expect(debitRegisterStore.creditCardList[0].debts[0].name, 'name');
    });
  });
}
