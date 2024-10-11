

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/modules/change_password/cubit/states.dart';

import '../../../shared/constants/constants.dart';
import '../../../shared/network/end_points/end_points.dart';
import '../../../shared/network/remote/remote.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  ChangePasswordCubit() : super(ChangePasswordInitialState());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);


  changePassword({required String oldPassword,required String newPassword,required String confirmNewPassword}){
    emit(ChangePasswordLoadingState());

    DioHelper.postDataWithBearearToken(url: CHANGEPASSWORD,token: token.toString(),data: {
      'current_password':oldPassword,
      'new_password':newPassword,
      "new_password_confirmation":newPassword
    })
        .then((value) {
      print(value.data.toString());
      emit(ChangePasswordSuccessState(value.data['message']));
    }).catchError((error){
      print(error.toString());
      emit(ChangePasswordErrorState(error.toString()));
    });

  }
}