
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';


class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {

    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return  Scaffold(
            appBar:AppBar(title:const Text("Orders"),),
              body: Container(
                  margin: const EdgeInsets.all(15),
              child:ListView(
                children: const [
                  Center(child: Text("data")),
                ],
              )),
            );
        }
      );
  }
}


