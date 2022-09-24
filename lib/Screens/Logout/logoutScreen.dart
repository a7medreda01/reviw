import 'package:flutter/material.dart';

import '../../face.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Container(
        width: 400,
        height: 200,

        child: Column(
          children: [
            SizedBox(height: 15,),
            Icon(Icons.logout,size: 73,),
            MaterialButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Face(),),);
            },
              child: Text('Log out',style: TextStyle(color: Colors.red,fontSize: 33,fontWeight: FontWeight.bold),),
            ),


          ],
        )
    );
  }
}
