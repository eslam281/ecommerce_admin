
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonAppbar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String textbutton;
  final bool active;
  const CustomButtonAppbar({super.key, this.onPressed,
    required this.icon, required this.textbutton, required this.active});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(onPressed:onPressed,
      child:  Column(
        mainAxisSize:MainAxisSize.min,
        children: [
          Icon(icon,color: active? AppColor.primaryColor : AppColor.grey2,size: 30,),
          Text(textbutton,style:TextStyle(
              color:active? AppColor.primaryColor :AppColor.grey2),)
        ],),
    );
  }
}
