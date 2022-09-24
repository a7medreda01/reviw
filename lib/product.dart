import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reviw/Screens/Home/categoryPovider.dart';

import 'Screens/Products/productsProvider.dart';

class ProductItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductItem();
}

class _ProductItem extends State<ProductItem> {
  @override
  void initState(){
    Provider.of<ProductProvider>(context,listen: false).getAllProducts();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Consumer<ProductProvider>(
        builder: (context,products,child){
      return GridView.builder(
      itemCount: 1,
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 13,
          crossAxisSpacing: 13,
          childAspectRatio: 1

      ),
          itemBuilder: (context,index){
            return Scaffold(
              appBar: AppBar(),
                body: Center(child: Text(products.products!.data!.products[index].name.toString()))
            );
          }
          );
          }

      );

        }



}