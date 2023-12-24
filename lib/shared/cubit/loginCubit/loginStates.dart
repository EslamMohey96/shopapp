import 'package:shop_app/models/loginModel.dart';

abstract class myLoginStates {}

class myLoginInitState extends myLoginStates {}

class myLogvisiblePasswordState extends myLoginStates {}

class getAllUsersSuccessState extends myLoginStates {}

class getAllUsersErrorState extends myLoginStates {
  late final String error;
  getAllUsersErrorState(this.error) {
    print(error);
  }
}

class getAllUsersLoadingState extends myLoginStates {}

class changeMassageState extends myLoginStates {}

class changeTokenState extends myLoginStates {}

class loginLoadingState extends myLoginStates {}

class loginSuccessState extends myLoginStates {
  late final loginModel login_model;
  loginSuccessState(this.login_model);
}

class loginErrorState extends myLoginStates {
  late final String error;
  loginErrorState(this.error) {
    print(error);
  }
}
