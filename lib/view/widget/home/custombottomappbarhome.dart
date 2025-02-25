
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/orderscreencontroller.dart';
import 'custombuttonappbar.dart';


class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OrderScreenControllerImp>(builder: (controller) =>
        BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin:10,
          child: Row(
            children: [
              ...List.generate(controller.listpage.length,(i) {
                 return  Expanded(
                   child: CustomButtonAppbar(
                     icon: controller.bottomappbat[i]["icon"]
                     ,textbutton:controller.bottomappbat[i]["title"],
                      active:controller.currentpage==i? true:false,
                      onPressed:(){controller.changePage(i);}
                      ,),
                 );}
              )
            ],
          ),),);
  }
}
