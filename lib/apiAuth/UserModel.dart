import 'dart:convert';

class UserModel{
  String? name;
  String? cpf;
  String? email;
  String? password;
  String? tel;
  String? emerg;

  UserModel({required this.name,required this.cpf,required this.email,required this.password,required this.tel,required this.emerg});

  UserModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
    cpf = json['cpf'];
    email = json['email'];
    password = json['password'];
    tel = json['tel'];
    emerg = json['emerg'];
  }

  String toJson(){
    Map<String,dynamic> data = {
      "name": name,
      "cpf": cpf,
      "email":email,
      "password":password,
      "tel":tel,
      "emerg":emerg
    };
    final json = jsonEncode(data);
    return json;
  }




}