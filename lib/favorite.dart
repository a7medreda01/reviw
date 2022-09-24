import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reviw/shared/cubit.dart';
import 'package:reviw/shared/state.dart';

import 'favoriteProvider.dart';
import 'getFavoriteProvider.dart';

class Favorite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Favorite();
}

class _Favorite extends State<Favorite> {

  @override
  void initState(){
    Provider.of<GetFavoriteProvider>(context,listen: false).getgetAllFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetFavoriteProvider>(builder: (context, favorite, child)
    {
      return
        Scaffold(
            appBar: AppBar(),
            body: favorite.getfavorites!.data!.data == null?
        Center(child: CircularProgressIndicator(color: Colors.blue),):
            GridView.builder(
                physics: new NeverScrollableScrollPhysics(),
                //no scrol graidview
                scrollDirection: Axis.vertical,
                itemCount: 4,


                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.77,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Expanded(


                     child: Container(
                        child: Text("test"),

                      )
                  );
                }
            )
        );
    }
    );
  }
}









