import '../../../../entities/errorModel.dart';
import 'home_abstract_main_state.dart';

class HomeFailedRegisterState extends HomeStoreState{
  HomeFailedRegisterState({required this.errorModel});
  ErrorModel errorModel;
}