import 'dart:convert';

import 'package:appgym/apiAuth/SharedServices.dart';
import 'package:appgym/apiAuth/UserModel.dart';
import 'package:http/http.dart' as http;


class AuthService {
  Uri urlRegister = Uri.parse('https://api-nvjt0eai8-hnetos-projects.vercel.app/api/user');
  Uri urlLogin = Uri.parse('https://api-nvjt0eai8-hnetos-projects.vercel.app/api/user/auth');


  Future<bool> Register(UserModel req)async{
    String data = req.toJson();
    final res = await http.post(urlRegister,body:data,headers: {
      "content-type": "application/json"
    });
    if(res.statusCode == 200){
      return true;
    }
    return false;
  }

  Future<UserModel?> Login(Map<String,dynamic> data)async{
    final res = await http.post(urlLogin,body:jsonEncode(data),headers: {
      "content-type": "application/json"
    });
    if(res.statusCode == 200){
      final id = jsonDecode(res.body);
      final getUser = await http.get(Uri.parse('https://api-b6gjphh37-hnetos-projects.vercel.app/api/user/$id'));
      UserModel user = UserModel.fromJson(jsonDecode(getUser.body));
      final shared = await SharedServices().setLogin(user);
      return user;
    }
    return null;
  }




}