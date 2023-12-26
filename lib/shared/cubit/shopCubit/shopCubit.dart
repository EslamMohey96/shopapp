import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categoriesModel.dart';
import 'package:shop_app/models/favoritesModel.dart';
import 'package:shop_app/models/homeModel.dart';
import 'package:shop_app/models/isFavoritesModel.dart';
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

  int index = 0;
  late int homeModelDone = 0;
  late homeModel home_model;
  late int categoriesModelDone = 0;
  late categoriesModel categories_model;
  late favoritesModel favorites_model;
  Map<int, bool> favList = {};
  late isFavoritesModel isFavorites;
  Map<int, bool> isFavList = {};
  late int is_favList = 0;

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

  void getHomeData() {
    emit(homeLoadingState());
    dioHelper
        .getData(url: home, token: Token, opt: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': Token,
        })
        .then((value) {
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

  void getCategoriesData() {
    emit(CategoriesLoadingState());
    dioHelper.getData(
      url: categories,
      token: Token,
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

  void changeFavoritesData(productId) {
    emit(favoritesLoadingState());
    dioHelper.postData(url: favorites, token: Token, opt: {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': Token,
    }, data: {
      'product_id': productId,
    }).then((value) {
      favorites_model = favoritesModel.fromJson(value.data);
      print(favorites_model.message);
      favList[productId] = !favList[productId]!;
      emit(favoritesSuccessState());
    }).catchError((onError) {
      emit(favoritesErrorState(onError));
    });
  }

  void IsFavoritesData() {
    emit(isFavoritesLoadingState());
    dioHelper.getData(
      url: favorites,
      token: Token,
      opt: {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': Token,
      },
    ).then((value) {
      isFavorites = isFavoritesModel.fromJson(value.data);
      print(isFavorites.data.dataF[1].id);
      is_favList = 1;
      emit(isFavoritesSuccessState());
    }).catchError((onError) {
      emit(isFavoritesErrorState(onError));
    });
  }
}
