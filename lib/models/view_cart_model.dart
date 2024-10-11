class ViewCartModel{
  List<CartDataModel>data=[];
 ViewCartModel.fromJson(Map<String,dynamic>json){
    json['data'].forEach((element){
      data.add(CartDataModel.fromJson(element));
    });
  }
}

class CartDataModel{
  int?id;
  int?user_id;
  int?total;
  String?type;
  int?product_id;
  ProductDataModel?product;
 CartDataModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    user_id=json['user_id'];
    total=json['total'];
    type=json['type'];
    product_id=json['product_id'];
    product = json['product'] != null ? ProductDataModel.fromJson(json['product']) : null;
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