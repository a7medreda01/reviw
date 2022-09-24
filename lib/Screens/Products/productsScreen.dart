
import 'package:carousel_slider/carousel_slider.dart';
import 'package:reviw/Screens/Products/productModel.dart';
import 'package:reviw/Screens/Products/productsProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:reviw/favorite.dart';
import 'package:reviw/product.dart';

import '../../favoriteProvider.dart';




class ProductScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductScreen();
}
class _ProductScreen extends State<ProductScreen>{

  @override
  void initState(){
    Provider.of<ProductProvider>(context,listen: false).getAllProducts();
    Provider.of<FavoriteProvider>(context,listen: false).getAllFavorite();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
        builder: (context,products,child){

      return products.products == null ?
      Center(
        child: CircularProgressIndicator(color: Colors.blue),):
      Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.yellow,
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: Colors.yellow,
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                  child: Row(
                    children: [
                      Container(
                        width: 47,
                        height: 47,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('assetss/applelogo.png'),
                        ),
                      ),
                      Container(
                        width: 47,
                        height: 47,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Image(
                          image: AssetImage('assetss/zaralogo.png'),
                        ),
                      ),
                      Container(
                        width: 47,
                        height: 47,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('assetss/marclogo.png'),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('assetss/applelogo.png'),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('assetss/nikelogo.png'),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('assetss/zaralogo.png',),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('assetss/adidaslogo.png'),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                         image: AssetImage('assetss/zaralogo.png'),
                        ),
                          ),
                      Container(
                        width: 47,
                        height: 47,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('assetss/applelogo.png'),
                        ),
                      ),
                      Container(
                        width: 47,
                        height: 47,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Image(
                          image: AssetImage('assetss/zaralogo.png'),
                        ),
                      )


                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
              children: [
                Container(
                  height: 220,
                  color: Colors.red.withOpacity(.3),
                ),
                Container(
                  height: 230,
                  color: Colors.orange.withOpacity(.3),
                ),
                Container(
                  height: 240,
                  color: Colors.yellow.withOpacity(.3),
                ),
                Container(
                  height: 245,
                  color: Colors.yellow.withOpacity(.2),
                ),
                CarouselSlider(
                  items: products.products!.data!.banners.map((e) =>
                      Image(image: NetworkImage("${e.image.toString()}"),fit: BoxFit.cover,width: double.infinity,)).toList(),
                  options: CarouselOptions(
                    height: 210,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    autoPlayCurve: Curves.fastOutSlowIn,

                  ),
              ),
            ],
          ),
          Text('منتجات جديدة',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign:TextAlign.center ),
          //من اول هنا هنبدأ ال Graidveiw
          Expanded(
              child: Container(
                color: Colors.yellowAccent.withOpacity(.4),
                child: Container(
                  color: Colors.yellow,
                  margin: EdgeInsets.all(6),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: GridView.builder(
                      physics: new NeverScrollableScrollPhysics(),//no scrol graidview
                      scrollDirection: Axis.vertical,
                      itemCount: products.products!.data!.products.length,


                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.77,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Expanded(
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(offset: Offset(2, 5),
                                  color: Colors.black12.withOpacity(0.5),
                                  blurRadius: 7,)
                              ],
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.white,

                            ),


                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  width: 280,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(products.products!.data!
                                            .products[index].image.toString())),

                                    borderRadius: BorderRadius.circular(9),
                                    color: Colors.white,

                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Image(
                                          image: AssetImage(
                                              'assetss/offer.png.png'),
                                          width: 25,),
                                      ),
                                      SizedBox(width: 110, height: 30,),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(7),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(products.products!.data!
                                              .products[index].name.toString(),
                                            style: TextStyle(color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                            textAlign: TextAlign.left,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text("code : " +
                                              products.products!.data!
                                                  .products[index].id.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,),
                                            textAlign: TextAlign.left,),
                                        ),
                                        SizedBox(height: 3,),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text(products.products!.data!
                                                      .products[index].price
                                                      .toString(), style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,),
                                                    textAlign: TextAlign.left,),
                                                  Text(products.products!.data!
                                                      .products[index].old_price
                                                      .toString(), style: TextStyle(
                                                      color: Colors.black.withOpacity(
                                                          .6),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                    textAlign: TextAlign.left,),


                                                ],
                                              ),
                                              SizedBox(width: 45),
                                              CircleAvatar(
                                                radius: 16,
                                                foregroundColor: Colors.blueGrey,
                                                child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
                                                  print(products.products!.data!.products[index].id);
                                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> Favorite()));
                                                  },),
                                                ),
                                              SizedBox(width: 4),
                                              Expanded(
                                                child: Consumer<FavoriteProvider>(builder: (context, favorite, child) {

                                                 return CircleAvatar(
                                                        radius: 16,
                                                        foregroundColor: Colors.blueGrey,
                                                        child: IconButton(icon: Icon(Icons.favorite_border,), onPressed: () {
                                                          favorite.getAllFavorite(
                                                            product_Id: products.products!.data!.products[index].id).then((value) {
                                                            print(favorite.favorites!.message);

                                                          });

                                                          },),
                                                      );
                        }
                        ),
                                              )


                                            ],
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      }
                  ),

                ),
              ),
            )




        ],
      ),
    );
  }

  );
}

}

