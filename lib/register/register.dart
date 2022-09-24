

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reviw/face.dart';
import 'package:reviw/login/Login.dart';
import 'package:reviw/navegationScreen.dart';
import 'package:reviw/register/registerProvider.dart';



class Register extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<Register>{


  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var phonecontroller = TextEditingController();




  bool ispass=true;
  var formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
              appBar: AppBar(),

              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assetss/backregister.jpg"),fit: BoxFit.cover)
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formkey,
                  child: Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Center(child: Text("Join Now",style: TextStyle(color: Colors.white,fontSize: 25, ),))),
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius:BorderRadius.all( Radius.circular(30))
                            ),
                            child: ListView(
                              children: [


                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: TextFormField(

                                    validator: (value) {
                                      if (value!.length <= 2) {
                                        return "Please Enter Your Name";
                                      }
                                      return null;
                                    },
                                    controller: namecontroller,
                                    decoration: InputDecoration(
                                        labelText: 'Name',
                                        hintText: 'Enter Your Name',
                                        prefixIcon: Icon(Icons.person),
                                        hintStyle: TextStyle(color: Colors.black54,
                                            fontSize: 10.0),

                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(.2),
                                          borderSide: BorderSide(),)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.all(10),

                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.length <= 6 || value.contains("-")) {
                                        return "Email not valid";
                                      }
                                      return null;
                                    },
                                    controller: emailcontroller,

                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        labelText: 'Email Adrees',
                                        hintText: 'Enter Your Email Adress',
                                        prefixIcon: Icon(Icons.email),
                                        hintStyle: TextStyle(color: Colors.black54,
                                            fontSize: 10.0),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(),)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.all(10),

                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.length <= 6) {
                                        return "Email not valid";
                                      }
                                      return null;
                                    },
                                    controller: passcontroller,

                                    obscureText: ispass,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        hintText: 'Enter Your Password',
                                        prefixIcon: Icon(Icons.lock_outlined),
                                        hintStyle: TextStyle(color: Colors.blue,
                                            fontSize: 10.0),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(),),
                                        suffix: IconButton(onPressed: () {
                                          setState(() {
                                            ispass = !ispass;
                                          });
                                        },
                                          icon: Icon(ispass ? Icons.visibility : Icons
                                              .visibility_off_outlined),
                                        )
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.all(10),

                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.length <= 6) {
                                        return "Phone not valid";
                                      }
                                      return null;
                                    },

                                    controller: phonecontroller,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        labelText: 'Phone',
                                        hintText: 'Enter Your phone Number',
                                        prefixIcon: Icon(Icons.phone),
                                        hintStyle: TextStyle(color: Colors.black54,
                                            fontSize: 10.0),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(),)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                    margin: EdgeInsets.all(10),

                                    color: Colors.blueAccent,
                                    alignment: Alignment.topCenter,
                                    width: 270,
                                    height: 40,
                                    child: Consumer<RegisterProvider>(
                                        builder :(context,register,child) {


                                          return MaterialButton(onPressed: () {


                                            if (formkey.currentState!.validate()) {

                                              register.register(
                                                name:namecontroller.text,
                                                email:emailcontroller.text,
                                                password:passcontroller.text,
                                                phone:phonecontroller.text,

                                              ).then((value) {
                                                if (register.registerModel?.status ==
                                                    false) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                        register.registerModel!.message
                                                            .toString()),
                                                    duration: Duration(seconds: 1),
                                                    backgroundColor: Colors.blue,
                                                  ));
                                                }
                                                else {
                                                  if (register.registerModel?.status ==
                                                      true) {
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                          register.registerModel!.message
                                                              .toString()),
                                                      duration: Duration(seconds: 1),
                                                      backgroundColor: Colors.blue,
                                                    ));

                                                    register.data == null ?
                                                    Center(
                                                      child: CircularProgressIndicator(
                                                          color: Colors.blue),) :
                                                    Navigator.pushReplacement(context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                HomeScreen()));
                                                  }
                                                  print("value " + value.toString());
                                                }
                                              } );


                                            }
                                          },
                                            height: 40,
                                            minWidth: 270,
                                            child: Text('Register', style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                              textAlign: TextAlign.center,),


                                          );
                                        }
                                    )
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('You have an account !',
                                        style: TextStyle(fontSize: 12)),
                                    InkWell(onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => Login()));
                                    },
                                        child: Text(' Login', style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue))
                                    )

                                  ],
                                ),
                                SizedBox(height: 10),



                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            );
        }

        }
