import '../../../entities/errorModel.dart';
import 'main_state.dart';

class DebitFailedRegisterState extends DebitStoreState{
  DebitFailedRegisterState({required this.errorModel});
  ErrorModel errorModel;
}