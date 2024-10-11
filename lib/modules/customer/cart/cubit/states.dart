abstract class ViewCartStates {}

class ViewCartInitialState extends ViewCartStates {}

class ViewCartLoadingState extends ViewCartStates {}

class ViewCartSuccessState extends ViewCartStates {
  final int statusCode;

  ViewCartSuccessState(this.statusCode);
}

class ViewCartErrorState extends ViewCartStates {
  final String error;

  ViewCartErrorState(this.error);
}

class DeleteCartLoadingState extends ViewCartStates {}

class DeleteCartSuccessState extends ViewCartStates {
  final int statusCode;

  DeleteCartSuccessState(this.statusCode);
}

class DeleteCartErrorState extends ViewCartStates {
  final String error;

  DeleteCartErrorState(this.error);
}
