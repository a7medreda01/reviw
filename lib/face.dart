import 'package:flutter/material.dart';
import 'package:reviw/login/Login.dart';
import 'package:reviw/register/register.dart';

class Face extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Face();

}

class _Face extends State<Face>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:  DecorationImage(image: AssetImage("assetss/backgroundmarket2.jpg"),fit: BoxFit.cover,opacity: .950),
        ),
        child: ListView(
          children: [
            SizedBox(height: 50),
            Column(
              children:[
                Text('Hello in                                      ' , style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,),textAlign: TextAlign.left,),
                Text('MY MARKET' , style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 32),textAlign: TextAlign.center),
             ]
            ),
            SizedBox(height: 440),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              alignment: Alignment.center,
              width: 500,
              height: 180,

              child: Column(
                children: [
                  Container(

                    width: 500,
                    height: 65,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       border: Border.all(color: Colors.black38,width: .8,style: BorderStyle.solid),
                         borderRadius: BorderRadius.circular(100),
                     ),
                     child: MaterialButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                     },
                      child: Text('Login',style: TextStyle(fontSize: 20,),),
                       ),

                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: 500,
                    height: 65,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(100)
                    ),


                    child: MaterialButton(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                    },
                      child: Text('Creat Account',style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),

                  )


                ],

              ),
            ),
          ],
        ),
      )

    );
  }

}
