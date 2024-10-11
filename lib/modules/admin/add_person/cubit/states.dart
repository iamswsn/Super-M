abstract class AddPersonStates{}

class AddPersonInitialState extends AddPersonStates{}

class AddPersonLoadingState extends AddPersonStates{}

class AddPersonSuccessState extends AddPersonStates{
  final int statusCode;
  AddPersonSuccessState(this.statusCode);
}

class AddPersonErrorState extends AddPersonStates{
  final String error;
  AddPersonErrorState(this.error);
}

class GetAllSuperMarketsLoadingState extends AddPersonStates{}

class GetAllSuperMarketsSuccessState extends AddPersonStates{
  final int statusCode;
  GetAllSuperMarketsSuccessState(this.statusCode);
}

class GetAllSuperMarketsErrorState extends AddPersonStates{
  final String error;
  GetAllSuperMarketsErrorState(this.error);
}

class ChangeSuperMarketState extends AddPersonStates{}