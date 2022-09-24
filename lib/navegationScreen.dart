
import 'package:reviw/Screens/Profile/profileScreen.dart';
import 'package:reviw/favorite.dart';

import 'Screens/Home/homeProducts.dart';
import 'Screens/Logout/logoutScreen.dart';
import 'Screens/Products/productsScreen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();


}




class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
  List<Widget>pages=[
    HomeProducts(),
    ProductScreen(),
    Profile(),
    Logout(),

  ];



  @override
  Widget build(BuildContext context) {
    print("context");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("MARKET",style: TextStyle(color:Colors.white,fontSize: 30,),),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: (){
            Navigator.push((context), MaterialPageRoute(builder: (context)=> Favorite()));
          },
              icon: Icon(Icons.favorite_sharp))
        ],


      ),
      body:
      pages[currentIndex],



      drawer:Drawer(
        backgroundColor:  Colors.white,
        child: Center(child: Text("Menu is empty",style: TextStyle(color: Colors.red)),),
      ),

      bottomNavigationBar:BottomNavigationBar(
        selectedFontSize: 20,
        backgroundColor: Colors.white54,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor:Colors.blue ,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            currentIndex=index;
            print("setstate");
          });
          print("current "+currentIndex.toString());
        },

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home,),
            label: "Home" ,
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.production_quantity_limits),
              label: "products"

          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.person),
              label: "Profile"
          ),
           BottomNavigationBarItem(
            icon:Icon(Icons.logout),
            label: "Log out"
          ),



        ],
      ) ,

    );
  }


}