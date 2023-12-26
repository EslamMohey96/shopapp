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

class CategoriesLoadingState extends shopStates {}

class CategoriesSuccessState extends shopStates {}

class CategoriesErrorState extends shopStates {
  late final dynamic error;
  CategoriesErrorState(this.error) {
    print(error);
  }
}

class favoritesLoadingState extends shopStates {}

class favoritesSuccessState extends shopStates {}

class favoritesErrorState extends shopStates {
  late final dynamic error;
  favoritesErrorState(this.error) {
    print(error);
  }
}

class isFavoritesLoadingState extends shopStates {}

class isFavoritesSuccessState extends shopStates {}

class isFavoritesErrorState extends shopStates {
  late final dynamic error;
  isFavoritesErrorState(this.error) {
    print(error);
  }
}