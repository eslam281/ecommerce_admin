import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Categories"),),
      body:Container(
        margin:EdgeInsets.all(10),
        child:ListView(children: [

        ],),
      ),

    );
  }
}
