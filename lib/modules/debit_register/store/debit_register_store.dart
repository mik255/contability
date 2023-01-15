import 'package:flutter/cupertino.dart';
import '../../../entities/credit_card.dart';
import '../../../entities/debt.dart';
import '../events/delete_on_db.dart';
import '../events/register_on_db.dart';
import '../events/update_on_db.dart';
import '../states/main_state.dart';

class DebitRegisterStore extends ValueNotifier<DebitStoreState>{
  DebitRegisterStore(super.value);

  register(CreditCard creditCard,Debt debt)async{
    await registerOnDB(value,creditCard,debt);
  }
  update(CreditCard creditCard,Debt debt){
    updateOnDB(value,creditCard,debt);
  }
  delete (CreditCard creditCard,Debt debt){
    deleteOnDB(value,creditCard,debt);
  }
}