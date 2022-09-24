import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:reviw/Screens/Products/productModel.dart';
import 'package:dio/dio.dart';
import 'package:reviw/product.dart';

class ProductProvider with ChangeNotifier {

  HomeModel? products;
  String? token;

  Future<dynamic> getAllProducts() async {
    var dio = Dio();
    dio.options.headers = {
      "lang": "ar",
      "Content-Type": "application/json",
      "Authorization": token,
    };

    final response = await dio.get("https://student.valuxapps.com/api/home");
    products = HomeModel.fromJson(response.data);
    notifyListeners();
  }

}