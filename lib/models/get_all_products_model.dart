class GetAllProductsModel{
  List<ProductDataModel>data=[];
  GetAllProductsModel.fromJson(Map<String,dynamic>json){
    json['data'].forEach((element){
      data.add(ProductDataModel.fromJson(element));
    });
  }
}

class ProductDataModel{
  int?id;
  String?name;
  String?company_name;
  String?photo;
  String?price;
  String?serial_number;
  String?type;
  int?supermarket_id;
  ProductDataModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
    company_name=json['company_name'];
    photo=json['photo'];
    price=json['price'];
    serial_number=json['serial_number'];
    type=json['type'];
    supermarket_id=json['supermarket_id'];
  }
}