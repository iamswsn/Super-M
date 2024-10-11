class CheckOutModel{
  CheckoutDataModel?message;
  CheckOutModel.fromJson(Map<String,dynamic>json){
    message = json['message'] != null ? CheckoutDataModel.fromJson(json['message']) : null;

  }
}

class CheckoutDataModel{
int?id;
  CheckoutDataModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
  }
}