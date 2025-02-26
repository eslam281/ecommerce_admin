
import 'package:flutter/material.dart';


class CardAdmin extends StatelessWidget {
  final String url;
  final String title;
  final void Function() onTap;
  const CardAdmin({super.key, required this.url, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:onTap,
      child: Card(child:Column(children: [
        Image.asset(url,width: 90, ),
        Text(title)
      ],),),
    );
  }
}
