import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/models/categoriesModel.dart';
import 'package:shop_app/models/favoritesModel.dart';
import 'package:shop_app/models/homeModel.dart';
import 'package:shop_app/models/isFavoritesModel.dart';
import 'package:shop_app/models/searchModel.dart';
import 'package:shop_app/models/userModel.dart';
import 'package:shop_app/modules/shopScreens/categories/categoriesScreen.dart';
import 'package:shop_app/modules/shopScreens/favorites/favoritesScreen.dart';
import 'package:shop_app/modules/shopScreens/products/productsScreen.dart';
import 'package:shop_app/modules/shopScreens/settings/settingsScreen.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/onBoardingCubit/onBoardingCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';
import 'package:shop_app/shared/network/remote/dioHelper/dioHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/endPoints.dart';

class shopCubit extends Cubit<shopStates> {
  shopCubit() : super(shopInitState());
  static shopCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> settingFormKey = formKeyList[3];

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
    homeModelDone = 0;
    emit(homeLoadingState());
    dioHelper
        .getData(url: home, opt: {
          'lang': lang,
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
    categoriesModelDone = 0;
    emit(CategoriesLoadingState());
    dioHelper.getData(
      url: categories,
      opt: {
        'lang': lang,
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
          'lang': lang,
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
    is_favList = 0;
    emit(isFavoritesLoadingState());
    dioHelper
        .getData(
          url: favorites,
          opt: {
            'lang': lang,
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
    dioHelper
        .getData(
          url: profile,
          opt: {
            'lang': lang,
            'Content-Type': 'application/json',
            'Authorization': Token,
          },
        )
        .then((value) {
          user_model = userModel.fromJson(value.data);
        })
        .then((value) {
          UpdateDone = 1;
          print("${user_model.data?.name}--------");
        })
        .then((value) => emit(userModelSuccessState()))
        .catchError((onError) {
          UpdateDone = 1;
          emit(userModelErrorState(onError));
        });
  }

// updateUserData
  late int UpdateDone = 0;
  void updateUserData(Map<String, dynamic>? data, context) {
    UpdateDone = 2;
    emit(updateUserLoadingState());
    dioHelper
        .putData(
            url: updateProfile,
            opt: {
              'lang': lang,
              'Content-Type': 'application/json',
              'Authorization': Token,
            },
            data: data)
        .then((value) {
      print("${value.data["status"]}>>>>>>>>>>");
      if (value.data["status"]) {
        getUserData();
        Fluttertoast.showToast(
          msg: value.data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: onBoardingCubit.get(context).lightMode
              ? Colors.white
              : Colors.black,
          fontSize: 16.0,
        );
        print(user_model.data?.name);
      } else {
        UpdateDone = 1;
        Fluttertoast.showToast(
          msg: value.data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: onBoardingCubit.get(context).lightMode
              ? Colors.white
              : Colors.black,
          fontSize: 16.0,
        );
      }
      emit(updateUserSuccessState());
    }).catchError((onError) {
      UpdateDone = 1;
      emit(updateUserErrorState(onError));
    });
  }

// searchData
  TextEditingController searchController = TextEditingController();
  late searchModel search_model;
  int searchDone = 0;
  void changeSearchData(searchKey) {
    emit(searchLoadingState());
    dioHelper.postData(url: search, opt: {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': Token,
    }, data: {
      'text': searchKey,
    }).then((value) {
      search_model = searchModel.fromJson(value.data);
      print(search_model.data?.data?.length);
      searchDone = 1;
      emit(searchSuccessState());
    }).catchError((onError) {
      emit(searchErrorState(onError));
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
