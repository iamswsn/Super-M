abstract class ShowProductDetailsStates {}

class ShowProductDetailsInitialState extends ShowProductDetailsStates {}


class ShowProductDetailsSuccessState extends ShowProductDetailsStates {
}

class UpdateProductLoadingState extends ShowProductDetailsStates {}

class UpdateProductSuccessState extends ShowProductDetailsStates {
  final int statusCode;

  UpdateProductSuccessState(this.statusCode);
}

class UpdateProductErrorState extends ShowProductDetailsStates {
  final String error;

  UpdateProductErrorState(this.error);
}

class DeleteProductLoadingState extends ShowProductDetailsStates {}

class DeleteProductSuccessState extends ShowProductDetailsStates {
  final int statusCode;

  DeleteProductSuccessState(this.statusCode);
}

class DeleteProductErrorState extends ShowProductDetailsStates {
  final String error;

  DeleteProductErrorState(this.error);
}
