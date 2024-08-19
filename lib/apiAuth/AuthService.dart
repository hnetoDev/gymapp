import 'dart:convert';

import 'package:appgym/apiAuth/SharedServices.dart';
import 'package:appgym/apiAuth/UserModel.dart';
import 'package:http/http.dart' as http;


class AuthService {
  Uri urlRegister = Uri.parse('https://api-tea.vercel.app/user');
  Uri urlLogin = Uri.parse('https://api-tea.vercel.app/user/auth');


  Future<int> Register(UserModel req)async{
    String data = req.toJsonUpdate();
    final res = await http.post(urlRegister,body:data,headers: {
      "content-type": "application/json"
    });
    return res.statusCode;
  }

  Future<UserModel?> Login(Map<String,dynamic> data)async{
    final res = await http.post(urlLogin,body:jsonEncode(data),headers: {
      "content-type": "application/json"
    });
    if(res.statusCode == 201){

      final UserModel user = UserModel.fromJson(jsonDecode(res.body));
      final shared = await SharedServices().setLogin(user);
      return user;
    }

    return null;
  }

  Future<int> Update(UserModel req)async{
    String data = req.toJsonUpdate();
    final UserModel? userPrev = await SharedServices().getData();

    Uri urlUpdate = Uri.parse('https://api-tea.vercel.app/user/${userPrev!.id!}');
    final res = await http.patch(urlUpdate,body: data,headers: {
      "content-type": "application/json"
    });

    print(res.statusCode);
    if(res.statusCode == 200 || res.statusCode == 201){
      final UserModel user = UserModel.fromJson(jsonDecode(res.body));
      print(user.id);
      final shared = await SharedServices().setLogin(user);
    }
    return res.statusCode;
  }





}