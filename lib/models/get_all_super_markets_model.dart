class GetAllSuperMarketsModel{
  List<SuperMarketDataModel>data=[];
  GetAllSuperMarketsModel.fromJson(Map<String,dynamic>json){
  json['data'].forEach((element){
  data.add(SuperMarketDataModel.fromJson(element));
  });
  }
}

class SuperMarketDataModel{
int?id;
String?name;
String?description;
  SuperMarketDataModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
    description=json['description'];
  }
}