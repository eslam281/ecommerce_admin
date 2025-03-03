
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/orderscreencontroller.dart';
import '../../widget/home/custombottomappbarhome.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());


    return GetBuilder<OrderScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(title:const Text("Orders"),),
          bottomNavigationBar:const CustomBottomAppBarHome(),
          body: controller.listpage.elementAt(controller.currentpage),
        );
      }
    );
  }
}
