
import 'package:admin/view/widget/home/cardadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/imageasset.dart';


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
                children: [
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                        (crossAxisCount: 3,mainAxisExtent: 150),
                      children: [
                        CardAdmin(url: "url", title: "Users", onTap: (){}),
                        CardAdmin(url: "url", title: "Product", onTap: (){}),
                        CardAdmin(url: "url", title: "Orders", onTap: (){}),
                        CardAdmin(url: "url", title: "Message", onTap: (){}),
                        CardAdmin(url: "url", title: "Report", onTap: (){}),

                      ])
                ],
              )),
            );
        }
      );
  }
}


