import 'package:shop_app/models/loginModel.dart';

abstract class profileStates {}

class profileInitState extends profileStates {}

class profileLoadingState extends profileStates {}

class profileSuccessState extends profileStates {
  late final loginModel login_model;
  profileSuccessState(this.login_model);
}

class profileErrorState extends profileStates {
  late final String error;
  profileErrorState(this.error) {
    print(error);
  }
}
