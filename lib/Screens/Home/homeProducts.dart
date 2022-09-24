
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:reviw/product.dart';

import 'categoryPovider.dart';



class HomeProducts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeProducts();
}
class _HomeProducts extends State<HomeProducts>{


  @override
  void initState(){
    Provider.of<CategoryProvider>(context,listen: false).getAllCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
        builder: (context,category,child){
          return
       category.categories!.data == null ?
      Center(
        child: CircularProgressIndicator(color: Colors.blue),):
      Scaffold(
          body: Container(
            margin: EdgeInsets.all(5),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: category.categories!.data!.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                  childAspectRatio: 1.3

                ),

                itemBuilder: (context, index){
                return Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          decoration: BoxDecoration(image: DecorationImage(
                            image: NetworkImage(
                                category.categories!.data!.data![index].image
                                    .toString()),)),

                        ),
                      ),
                      Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,

                          decoration: BoxDecoration(
                            color: Colors.blue,

                          ),
                          child: Text(
                            category.categories!.data!.data![index].name
                                .toString(), style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14), textAlign: TextAlign.center,)),

                    ],

                  );
              }
            ),
          )
          );

      }

      );
      }
      }