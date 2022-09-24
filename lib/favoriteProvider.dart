import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:reviw/Screens/Products/productModel.dart';
import 'package:dio/dio.dart';
import 'package:reviw/favoriteModel.dart';
import 'package:reviw/login/loginModel.dart';
import 'package:reviw/product.dart';
import 'package:reviw/login/loginProvider.dart';


class FavoriteProvider with ChangeNotifier {

  FavoriteModel? favorites;
  dynamic? token;
  Map<String,dynamic>?data;



  Future<dynamic> getAllFavorite({int? product_Id}) async {
    var dio = Dio();
    dio.options.headers = {
      "lang": "ar",
      "Content-Type": "application/json",
      "Authorization": "03hjMmeigOILxgiFh9g0rybV61IyQNqRneoDuBUbjhZuWCbM4PwIuA9QgqEfFRSDVgL1Br",
    };
    data = {
      "product_id": product_Id,
    };

    final response = await dio.post("https://student.valuxapps.com/api/favorites",data: data);
    favorites = FavoriteModel.fromJson(response.data);

    notifyListeners();


  }
}
