import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categoriesModel.dart';
import 'package:shop_app/models/favoritesModel.dart';
import 'package:shop_app/models/homeModel.dart';
import 'package:shop_app/models/isFavoritesModel.dart';
import 'package:shop_app/models/userModel.dart';
import 'package:shop_app/modules/shopScreens/categories/categoriesScreen.dart';
import 'package:shop_app/modules/shopScreens/favorites/favoritesScreen.dart';
import 'package:shop_app/modules/shopScreens/products/productsScreen.dart';
import 'package:shop_app/modules/shopScreens/settings/settingsScreen.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';
import 'package:shop_app/shared/network/remote/dioHelper/dioHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/endPoints.dart';

class shopCubit extends Cubit<shopStates> {
  shopCubit() : super(shopInitState());
  static shopCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> settingFormKey = GlobalKey<FormState>();

// changeBottomNav
  int index = 0;
  List<Widget> bottomScreens = [
    productsScreen(),
    categoriesScreen(),
    favoritesScreen(),
    settingsScreen(),
  ];
  void changeBottom(int index) {
    this.index = index;
    emit(changeBottomState());
  }

// getHomeData
  Map<int, bool> favList = {};
  late homeModel home_model;
  late int homeModelDone = 0;
  void getHomeData() {
    emit(homeLoadingState());
    dioHelper
        .getData(url: home, opt: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': Token,
        })
        .then((value) {
          favList = {};
          home_model = homeModel.fromJson(value.data);
          home_model.data.products.forEach((e) {
            favList[e.id] = e.in_favorites;
          });
          emit(homeSuccessState());
        })
        .then((value) => homeModelDone = 1)
        .catchError((onError) {
          emit(homeErrorState(onError));
        });
  }

// getCategoriesData
  late int categoriesModelDone = 0;
  late categoriesModel categories_model;
  void getCategoriesData() {
    emit(CategoriesLoadingState());
    dioHelper.getData(
      url: categories,
      opt: {
        'lang': 'en',
      },
    ).then((value) {
      categoriesModelDone = 1;
      categories_model = categoriesModel.fromJson(value.data);
      emit(CategoriesSuccessState());
    }).catchError((onError) {
      emit(CategoriesErrorState(onError));
    });
  }

// changeFavoritesData
  late favoritesModel favorites_model;
  void changeFavoritesData(productId) {
    emit(favoritesLoadingState());
    dioHelper
        .postData(url: favorites, opt: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': Token,
        }, data: {
          'product_id': productId,
        })
        .then((value) {
          favorites_model = favoritesModel.fromJson(value.data);
          print("${favorites_model.message}+++");
          favList[productId] = !favList[productId]!;
          emit(favoritesSuccessState());
        })
        .then((value) => IsFavoritesData())
        .catchError((onError) {
          emit(favoritesErrorState(onError));
        });
  }

// IsFavoritesData
  late isFavoritesModel isFavorites;
  List<DataF> isFavList = [];
  late int is_favList = 0;
  void IsFavoritesData() {
    emit(isFavoritesLoadingState());
    dioHelper.getData(
      url: favorites,
      opt: {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': Token,
      },
    )
    .then((value) {
      isFavList = [];
      isFavorites = isFavoritesModel.fromJson(value.data);      
    })
    .then((value) {
      if (isFavorites.data!.dataF.isNotEmpty) {
        isFavorites.data?.dataF.forEach((e) {
          isFavList.add(e);
        });
        is_favList = 1;
      } else {
        is_favList = 2;
      }
    })
    .then((value) => emit(isFavoritesSuccessState()))
    .catchError((onError) {
      emit(isFavoritesErrorState(onError));
    });
  }

// getUserData
  late userModel user_model;
  void getUserData() {
    emit(userModelLoadingState());
    dioHelper.getData(
      url: profile,
      opt: {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': Token,
      },
    ).then((value) {
      user_model = userModel.fromJson(value.data);
    })
    .then((value) {
      UpdateDone = 1;
      print("${user_model.data?.name}--------");      
    })
    .then((value) => emit(userModelSuccessState()))
    .catchError((onError) {
      emit(userModelErrorState(onError));
    });
  }

// updateUserData
  late int UpdateDone;
  void updateUserData(Map<String, dynamic>? data) {
    UpdateDone = 0;
    emit(updateUserLoadingState());
    dioHelper
        .putData(
            url: updateProfile,
            opt: {
              'lang': 'en',
              'Content-Type': 'application/json',
              'Authorization': Token,
            },
            data: data)
        .then((value) {
      getUserData();
      print(user_model.data?.name);
      UpdateDone = 1;
      emit(updateUserSuccessState());
    }).catchError((onError) {
      emit(updateUserErrorState(onError));
    });
  }

// changeVisiblePassword1
  late TextEditingController userNameController =
      TextEditingController(text: user_model.data?.name);
  late TextEditingController emailController =
      TextEditingController(text: user_model.data?.email);
  late TextEditingController phoneController =
      TextEditingController(text: user_model.data?.phone);
  late TextEditingController passwordController1 = TextEditingController();
  // late TextEditingController passwordController2 = TextEditingController();
  bool visiblePassword1 = false;
  bool visiblePassword2 = false;

  void changeVisiblePassword1(bool pass) {
    visiblePassword1 = pass;
    emit(userVisiblePasswordState());
  }

  // void changeVisiblePassword2(bool pass) {
  //   visiblePassword2 = pass;
  //   emit(userVisiblePasswordState());
  // }
}
