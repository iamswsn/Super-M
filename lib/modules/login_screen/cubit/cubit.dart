import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/modules/login_screen/cubit/states.dart';

import '../../../models/login_model.dart';
import '../../../shared/constants/constants.dart';
import '../../../shared/network/end_points/end_points.dart';
import '../../../shared/network/local/local.dart';
import '../../../shared/network/remote/remote.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


  late LoginModel loginModel;

  login({required String email, required String passsword}) async {
    emit(LoginLoadingState());
    await DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': passsword,
    }).then((value) {
      print(value.toString());
      loginModel = LoginModel.fromJson(value.data);
      log(loginModel.toString());
      CacheHelper.saveData(key: "token", value: loginModel.access_token);
      token = CacheHelper.getData(key: "token");
      CacheHelper.saveData(key: "supermarket_id", value: loginModel.user!.supermarket_id.toString()??"");
      supermarketID = CacheHelper.getData(key: "supermarket_id");
      CacheHelper.saveData(key: "name", value: loginModel.user!.name);
      name = CacheHelper.getData(key: "name");
      CacheHelper.saveData(key: "user_type", value: loginModel.user!.user_type!);
      usertype = CacheHelper.getData(key: "user_type");
      CacheHelper.saveData(key: "email", value: loginModel.user!.email);
      email = CacheHelper.getData(key: "email");
      CacheHelper.saveData(key: "id", value: loginModel.user!.id);
      id = CacheHelper.getData(key: "id");
      CacheHelper.saveData(key: "phone", value: loginModel.user!.phone);
      phone = CacheHelper.getData(key: "phone");
      print(phone);
      emit(LoginSuccessState(value.statusCode.toString()));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }


  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginChangePasswordVisibility());
  }



}
