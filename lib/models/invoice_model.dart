import 'package:self_checker/models/get_all_products_model.dart';
class InvoiceModel{
  InvoiceDataModel?data;
  InvoiceModel.fromJson(Map<String,dynamic>json){
    data = json['data'] != null ? InvoiceDataModel.fromJson(json['data']) : null;

  }
}

class InvoiceDataModel{
  int?id;
  int?amount;
  int?user_id;
  String?created_at;
  List<ProductDataModel>products=[];
  InvoiceDataModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    amount=json['amount'];
    user_id=json['user_id'];
    created_at=json['created_at'];
    json['products'].forEach((element){
      products.add(ProductDataModel.fromJson(element));
    });
  }
  //DateFormat.yMd().format(DateTime.parse(json['created_at']));
}