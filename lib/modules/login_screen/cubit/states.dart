
import '../../../models/login_model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates{
  final String statusCode;
  LoginSuccessState(this.statusCode);
}

class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}

class LoginChangeIcon extends LoginStates{}



class LoginChangePasswordVisibility extends LoginStates{}


