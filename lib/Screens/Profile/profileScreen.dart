
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _Profile();
}

class _Profile extends State<Profile> {
  var passwordcontroller = TextEditingController;

  File? image;

  uploadImage() async {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else
      return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 250,
              child: Stack(
                fit: StackFit.loose,

                children: [

                  Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 200,
                      child: Image(image: AssetImage('assetss/messi1.jpg'),
                        fit: BoxFit.cover,)
                  ),
    Container(
    alignment: Alignment.topCenter,
    child: image == null
    ? Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    margin: EdgeInsets.only(top: 30),
    child: Text(
    "add cover photo",
    style:
    TextStyle(fontSize: 20, color: Colors.blue),
    ),
    ),
    Container(
    child: IconButton(
    onPressed: uploadImage,
    icon: Icon(
    Icons.add_a_photo,
    color: Colors.blueAccent,
    size: 60,
    )),
    ),
    ],
    )
        : Image.file(
    image!,
    fit: BoxFit.fill,
    height: 200,
    width: double.infinity,
    ),
    ),
                  Positioned(
                    top: 80,
                    child: SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height,),
                  ),

                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Lionel Messi', style: TextStyle(color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20), textAlign: TextAlign.center),
                  CircleAvatar(child: Icon(Icons.done, size: 14,), radius: 10,),
                ]
            ),
            SizedBox(height: 10,),


            Container(
              margin: EdgeInsets.all(9),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(offset: Offset(2, 5),
                    color: Colors.black12.withOpacity(0.5),
                    blurRadius: 7,)
                ],
                borderRadius: BorderRadius.circular(9),
                color: Colors.white,

              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 145,
              child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(6),
                        child: Text(
                            'Adress : Argentina - 123 street Buenos Aires',
                            style: TextStyle(color: Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 15), textAlign: TextAlign.start)),
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(6),
                        child: Text('Your Phone Number : +54 262672727',
                            style: TextStyle(color: Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 15), textAlign: TextAlign.start)),
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(6),
                        child: Text('User Name : messi10', style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 15), textAlign: TextAlign.start)),
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(6),
                        child: Text('Email Adress : messi10@gmail.com',
                            style: TextStyle(color: Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 15), textAlign: TextAlign.start)),
                  ]
              ),
            ), //البيانات
            SizedBox(height: 10,),
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Edite Your Profile ', style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),),
                  Icon(Icons.edit, size: 23,)

                ],
              ),
            ),

            SizedBox(height: 15,),

            Container(
              margin: EdgeInsets.all(9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),


              ),


              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      readOnly: true,
                      initialValue: 'messi10',
                      decoration: InputDecoration(
                        labelText: 'Fixed User Name',
                        prefixIcon: Icon(Icons.person),
                        hintStyle: TextStyle(color: Colors.black54,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(borderSide: BorderSide(),),

                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: TextFormField(
                      readOnly: true,
                      initialValue: 'messi10@gmail.com',
                      decoration: InputDecoration(
                          labelText: 'Fixed Email',
                          prefixIcon: Icon(Icons.alternate_email),
                          hintStyle: TextStyle(color: Colors.blueGrey,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(borderSide: BorderSide(),)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: TextFormField(
                      initialValue: '+54',
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        hintText: 'Enter Your Pone',
                        prefixIcon: Icon(Icons.phone),
                        hintStyle: TextStyle(
                            color: Colors.blue, fontSize: 10.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: TextFormField(
                      obscureText: true,
                      initialValue: '54 29272727',
                      decoration: InputDecoration(
                          labelText: 'Edit PassWord',
                          hintText: 'Enter Your Password',
                          prefixIcon: Icon(Icons.password),
                          hintStyle: TextStyle(
                              color: Colors.blue, fontSize: 10.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),)
                      ),

                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 10,),
            CircleAvatar(radius: 30,
                child: Text('Save', style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),


          ]
      ),
    );
  }
}

