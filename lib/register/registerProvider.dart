import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reviw/register/registerModel.dart';

class RegisterProvider extends ChangeNotifier{

  RegisterModel? registerModel;
  Map<String , dynamic>? data;

  Future<dynamic> register({
    String? name,
    String? email,
    String? password,
    String? phone,
})async{
    var dio = Dio();
    dio.options.headers={
      "lang":"ar",
      "Content-Type":"application/json",
    };
    data={
      "name":name,
      "email":email,
      "password":password,
      "phone":phone,
    };
    notifyListeners();
    final response = await dio.post("https://student.valuxapps.com/api/register",data:data,);
    print("data register "+response.data.toString());
    registerModel=RegisterModel.fromJson(response.data);

  }

}