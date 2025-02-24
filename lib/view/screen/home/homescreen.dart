
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/home/Homescreencontroller.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
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
