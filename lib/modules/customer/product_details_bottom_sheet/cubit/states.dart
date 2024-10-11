abstract class AddToCartStates{}

class AddToCartInitialState extends AddToCartStates{}

class AddToCartLoadingState extends AddToCartStates{}

class AddToCartSuccessState extends AddToCartStates{}

class AddToCartErrorState extends AddToCartStates{
  final String error;
  AddToCartErrorState(this.error);
}

class ChangeQuantityState extends AddToCartStates{}

class CalculatePriceState extends AddToCartStates{}


class ShowPriceState extends AddToCartStates{}