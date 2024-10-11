import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/modules/register_screen/cubit/states.dart';
import '../../../shared/network/end_points/end_points.dart';
import '../../../shared/network/remote/remote.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);


  register(
      { required String name,required String email,required String password,required String phone}) async {
    emit(RegisterLoadingState());
    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      "password_confirmation":password,
      'phone':phone,
      'user_type':"customer",
      "supermarket_id":"1"
    });
    DioHelper.postDataWithImage(url: REGISTER, data: formData, length: 1)
        .then((value) {
      print(value.statusCode.toString());
      print(value.toString());
      emit(RegisterSuccessState(value.statusCode!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }


  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(RegisterChangePasswordVisibility());
  }



}
