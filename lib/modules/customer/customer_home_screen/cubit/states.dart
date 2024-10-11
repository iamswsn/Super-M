abstract class CustomerHomeStates{}

class HomeInitialState extends CustomerHomeStates{}

class ScanQrCodeSuccessState extends CustomerHomeStates{}

class ScanQrCodeErrorState extends CustomerHomeStates{}

class GetProductLoadingState extends CustomerHomeStates{}

class GetProductSuccessState extends CustomerHomeStates{
  final int statusCode;
  GetProductSuccessState(this.statusCode);
}

class GetProductErrorState extends CustomerHomeStates{
  final String error;
  GetProductErrorState(this.error);
}

class SearchProductState extends CustomerHomeStates{}
