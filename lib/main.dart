
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reviw/favoriteProvider.dart';
import 'package:reviw/login/Login.dart';
import 'package:reviw/face.dart';
import 'package:reviw/Screens/Products/productsProvider.dart';
import 'package:reviw/register/register.dart';
import 'package:reviw/register/registerProvider.dart';
import 'Screens/Home/categoryPovider.dart';
import 'getFavoriteProvider.dart';
import 'login/loginProvider.dart';
import 'navegationScreen.dart';


void main ()
{
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ListenableProvider<ProductProvider>(create: (_) => ProductProvider()),
        ListenableProvider<CategoryProvider>(create: (_) => CategoryProvider()),
        ListenableProvider<RegisterProvider>(create: (_) => RegisterProvider()),
        ListenableProvider<LoginProvider>(create: (_) => LoginProvider()),
        ListenableProvider<FavoriteProvider>(create: (_) => FavoriteProvider()),
        ListenableProvider<GetFavoriteProvider>(create: (_) => GetFavoriteProvider()),



      ],

    
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        appBarTheme: AppBarTheme(
          toolbarHeight: 40
        )
      ),
      home: Face(),
      //Face(),
    )
    );
  }
}




