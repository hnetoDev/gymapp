import 'dart:convert';

class UserModel{
  String? id;
  String? name;
  String? cpf;
  String? email;
  String? password;
  String? tel;
  String? emerg;
  String? genero;

  UserModel({required this.name,required this.cpf,required this.email,required this.password,required this.tel,required this.emerg, required this.genero, required this.id});

  UserModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    cpf = json['cpf'];
    email = json['email'];
    password = json['password'];
    tel = json['tel'];
    emerg = json['emerg'];
    genero = json['genero'];
  }
  String toJsonUpdate(){
    Map<String,dynamic> data = {
      "name": name,
      "cpf": cpf,
      "email":email,
      "password":password,
      "tel":tel,
      "emerg":emerg,
      "genero":genero
    };
    final json = jsonEncode(data);
    return json;
  }

  String toJson(){
    Map<String,dynamic> data = {
      "id": id,
      "name": name,
      "cpf": cpf,
      "email":email,
      "password":password,
      "tel":tel,
      "emerg":emerg,
      "genero":genero
    };
    final json = jsonEncode(data);
    return json;
  }




}