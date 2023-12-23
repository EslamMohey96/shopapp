import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/loginModel.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginStates.dart';
import 'package:shop_app/shared/cubit/profileCubit/profileStates.dart';
import 'package:shop_app/shared/network/remote/dioHelper/dioHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/endPoints.dart';

class profileCubit extends Cubit<profileStates> {
  profileCubit() : super(profileInitState());
  static profileCubit get(context) => BlocProvider.of(context);
  late loginModel login_model = loginModel.fromJson({
    "status": true,
    "message": null,
    "data": {
      "id": 61121,
      "name": "Eslam Mohey",
      "email": "eslammohey@gmail.com",
      "phone": "01234554321",
      "image": "https://student.valuxapps.com/storage/assets/defaults/user.jpg",
      "points": 0,
      "credit": 0,
      "token":
          "gm8iCWJdeEPJge8iPn1gKmtsiYXvYETFvpzNCwsnk1KRqe61OJjqusvwmdKjnW8IVNsS3g"
    }
  });

  void userData({
    required token,
  }) {
    emit(profileLoadingState());
    dioHelper.postData(
      url: profile,
      data: {
        "Authorization":
            "gm8iCWJdeEPJge8iPn1gKmtsiYXvYETFvpzNCwsnk1KRqe61OJjqusvwmdKjnW8IVNsS3g"
      },
    ).then((value) {
      emit(profileSuccessState(login_model));
      login_model = loginModel.fromJson(value.data);
      print(login_model);
    }).catchError((onError) {
      emit(profileErrorState(onError.toString()));
    });
  }
}
