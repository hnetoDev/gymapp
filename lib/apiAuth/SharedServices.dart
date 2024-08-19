import 'dart:convert';

import 'package:appgym/apiAuth/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedServices{

  Future<bool> isLogged()async{
    final shared = await SharedPreferences.getInstance();
    String? detais = await shared.getString('Login-details');
    if(detais != '' && detais != null){
      return true;
    }
    return false;
  }

  Future<void> setLogin(UserModel user)async{
    final shared = await SharedPreferences.getInstance();
    String data = user.toJson();
    final detais = await shared.setString('Login-details', data);
  }

  Future<void> Logout()async{
    final shared = await SharedPreferences.getInstance();
    shared.setString('Login-details', '');
  }


  Future<UserModel?> getData()async{
    final shared = await SharedPreferences.getInstance();
    String? data = await shared.getString('Login-details');
    if(data != '' && data != null){
      UserModel user = UserModel.fromJson(jsonDecode(data));
      return user;
    }
    return null;
  }
}