abstract class GetProductStates{}

class GetProductInitialState extends GetProductStates{}

class GetProductLoadingState extends GetProductStates{}

class GetProductSuccessState extends GetProductStates{
  final int statusCode;
  GetProductSuccessState(this.statusCode);
}

class GetProductErrorState extends GetProductStates{
  final String error;
  GetProductErrorState(this.error);
}