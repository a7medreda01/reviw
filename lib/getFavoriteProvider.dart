import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:reviw/Screens/Products/productModel.dart';
import 'package:dio/dio.dart';
import 'package:reviw/favoriteModel.dart';
import 'package:reviw/login/loginModel.dart';
import 'package:reviw/product.dart';
import 'package:reviw/login/loginProvider.dart';

import 'getFavoriteModel.dart';


class GetFavoriteProvider with ChangeNotifier {

  GetFavoriteModel? getfavorites;
  dynamic? token;
  Map<String,dynamic>?data;



  Future<dynamic> getgetAllFavorite() async {
    var dio = Dio();
    dio.options.headers = {
      "lang": "ar",
      "Content-Type": "application/json",
      "Authorization": "03hjMmeigOILxgiFh9g0rybV61IyQNqRneoDuBUbjhZuWCbM4PwIuA9QgqEfFRSDVgL1Br",
    };


    final response = await dio.get("https://student.valuxapps.com/api/favorites");
    getfavorites = GetFavoriteModel.fromJson(response.data);
    notifyListeners();


  }
}
