
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/orders/orderscreencontroller.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/home/custombottomappbarhome.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar:const CustomBottomAppBarHome(),
          body:PopScope(
            onPopInvokedWithResult:(b, dynamic){
                alertExitApp();
            },
        canPop: false,
        child: controller.listpage.elementAt(controller.currentpage),
          )
        );
      }
    );
  }
}
