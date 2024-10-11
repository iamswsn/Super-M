class LoginModel{
  String?access_token;
  UserDataModel?user;
  LoginModel.fromJson(Map<String,dynamic>json){
    access_token=json['access_token'];
    user = json['user'] != null ? UserDataModel.fromJson(json['user']) : null;

  }
}

class UserDataModel{
  int?id;
  String?name;
  String?user_type;
  String?phone;
  String?email;
  int?supermarket_id;
  UserDataModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
    user_type=json['user_type'];
    phone=json['phone'];
    email=json['email'];
    supermarket_id=json['supermarket_id'];
  }
}