
abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{
  final int statusCode;
  RegisterSuccessState(this.statusCode);
}

class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);
}


class RegisterChangePasswordVisibility extends RegisterStates{}



