abstract class AddSuperMarketStates{}

class AddSuperMarketInitialState extends AddSuperMarketStates{}

class AddSuperMarketLoadingState extends AddSuperMarketStates{}

class AddSuperMarketSuccessState extends AddSuperMarketStates{
  final int statusCode;
  AddSuperMarketSuccessState(this.statusCode);
}

class AddSuperMarketErrorState extends AddSuperMarketStates{
  final String error;
  AddSuperMarketErrorState(this.error);
}