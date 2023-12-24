abstract class shopStates {}

class shopInitState extends shopStates{}

class changeIndexState extends shopStates{}

class changeBottomState extends shopStates {}

class homeLoadingState extends shopStates {}

class homeSuccessState extends shopStates {}

class homeErrorState extends shopStates {
  late final dynamic error;
  homeErrorState(this.error) {
    print(error);
  }
}

