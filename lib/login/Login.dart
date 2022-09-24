import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reviw/login/loginProvider.dart';
import 'package:reviw/navegationScreen.dart';
import 'package:reviw/Screens/Products/productsScreen.dart';
import 'package:reviw/register/register.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<Login> {

  @override
  void initState(){
    Provider.of<LoginProvider>(context,listen: false).login();

    super.initState();
  }

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool ispass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(10),
        color: Colors.greenAccent.withOpacity(.1),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formkey,
          child: ListView(
            children: [
              SizedBox(height: 15),
              Image(
                image: AssetImage('assetss/loginicon.png'),
                width: 100,
                height: 100,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              Container(
                child: TextFormField(
                  validator: (value) {
                    if (value!.length <= 6 || value.contains("?")) {
                      return "{Email not valid}";
                    }
                    return null;
                  },
                  controller: emailcontroller,
                  //validator: (value!.isEmpty),
                  decoration: InputDecoration(
                      labelText: 'Email Adrees',
                      hintText: 'Enter Your Email Adress',
                      prefixIcon: Icon(Icons.email),
                      hintStyle: TextStyle(color: Colors.blue, fontSize: 10.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      )),
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: TextFormField(
                  validator: (value) {
                    if (value!.length <= 6) {
                      return "password short";
                    }
                    return null;
                  },
                  controller: passwordcontroller,
                  //validator: (value!.isEmpty),

                  obscureText: ispass,
                  decoration: InputDecoration(
                      labelText: '{Password}',
                      hintText: 'Enter Your Password',
                      prefixIcon: Icon(Icons.lock_outlined),
                      hintStyle: TextStyle(color: Colors.blue, fontSize: 10.0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            ispass = !ispass;
                          });
                        },
                        icon: Icon(ispass
                            ? Icons.visibility
                            : Icons.visibility_off_outlined),
                      )),
                ),
              ),
              SizedBox(height: 15),
              Consumer<LoginProvider>(builder: (context, login, child) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    alignment: Alignment.center,
                    width: 500,
                    height: 40,
                    child: MaterialButton(
                      onPressed: () {
                        login.login(
                          email: emailcontroller.text,
                          password: passwordcontroller.text,
                        ).then((value) {
                          //
                          if (formkey.currentState!.validate()) {
                            if (login.loginModel!.status == false )
                            {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                  content: Text(login.loginModel!.message.toString()),
                            duration : Duration(seconds : 1),
                            backgroundColor : Colors.blue,
                            ));
                            }
                            else
                            {
                            if (login.loginModel!.status ==
                            true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    login.loginModel!.message.toString()),
                                duration: Duration(seconds: 1),
                                backgroundColor: Colors.blue,
                              ));

                              login.loginModel! == null ?
                              Center(child: CircularProgressIndicator(
                                  color: Colors.blue),) :
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ProductScreen()));
                            }
                            }

                            }  // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                          }

                        );
                      },
                      color: Colors.blueAccent,
                      height: 40,
                      minWidth: 270,
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ));
              }),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('dont have account', style: TextStyle(fontSize: 12)),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: Text(' Register now',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
