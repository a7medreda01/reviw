import 'package:flutter/material.dart';
import 'package:reviw/Screens/Products/productModel.dart';
import 'package:dio/dio.dart';

import 'categoryModel.dart';

class CategoryProvider with ChangeNotifier{

  CategoryModel? categories;
  String? token;

  Future<dynamic> getAllCategory() async{
    var dio=Dio();
    dio.options.headers={
      "lang":"ar",
      "Authorization":token,
    };

    final response= await dio.get("https://student.valuxapps.com/api/categories");
    categories= CategoryModel.fromJson(response.data);
    notifyListeners();

  }


}