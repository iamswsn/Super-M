abstract class AddProductStates{}

class AddProductInitialState extends AddProductStates{}

class AddProductLoadingState extends AddProductStates{}

class AddProductSuccessState extends AddProductStates{
  final int statusCode;
  AddProductSuccessState(this.statusCode);
}

class AddProductErrorState extends AddProductStates{
  final String error;
  AddProductErrorState(this.error);
}