abstract class CheckOutStates {}

class CheckOutInitialState extends CheckOutStates {}

class CheckOutLoadingState extends CheckOutStates {}

class CheckOutSuccessState extends CheckOutStates {
  final int statusCode;

  CheckOutSuccessState(this.statusCode);
}

class CheckOutErrorState extends CheckOutStates {
  final String error;

  CheckOutErrorState(this.error);
}