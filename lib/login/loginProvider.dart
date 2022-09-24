import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'loginModel.dart';

class LoginProvider with ChangeNotifier{
  LoginModel? loginModel;
  Map<String,dynamic>?data;
  Future<dynamic> login({
  String? email,
  String? password,
})async{
    var dio=Dio();
    dio.options.headers={
      "lang":"ar",
      "Contant-Type":"application/json",
    };
    data = {
      "email":email,
      "password":password,

    };
    notifyListeners();
    final response = await dio.post("https://student.valuxapps.com/api/login",data: data);
    loginModel=LoginModel.fromJson(response.data);
  }
}