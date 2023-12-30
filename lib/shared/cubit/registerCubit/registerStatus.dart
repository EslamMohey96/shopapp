import 'package:shop_app/models/registerModel.dart';

abstract class registerStates {}

class registerInitStatus extends registerStates {}

class registervisiblePasswordState extends registerStates {}

class registerLoadingState extends registerStates {}

class registerSuccessState extends registerStates {
  late final registerModel register_model;
  registerSuccessState(this.register_model);
}

class registerErrorState extends registerStates {
  late final String error;
  registerErrorState(this.error) {
    print(error);
  }
}