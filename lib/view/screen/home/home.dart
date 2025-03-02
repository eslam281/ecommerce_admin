
import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/view/widget/home/cardadmin.dart';
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
                children: [
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                        (crossAxisCount: 3,mainAxisExtent: 150),
                      children: [
                        CardAdmin(url:AppImageAsset.logo, title: "Users", onTap: (){}),
                        CardAdmin(url: AppImageAsset.logo, title: "Items", onTap: (){
                          Get.toNamed(AppRoute.itemsview);
                        }),
                        CardAdmin(url: AppImageAsset.logo, title: "Categories", onTap: (){
                          Get.toNamed(AppRoute.categoriesview);
                        }),
                        CardAdmin(url: AppImageAsset.logo, title: "Orders", onTap: (){
                          Get.toNamed(AppRoute.order);
                        }),
                        CardAdmin(url: AppImageAsset.logo, title: "Message", onTap: (){}),
                        CardAdmin(url: AppImageAsset.logo, title: "Report", onTap: (){}),

                      ])
                ],
              )),
            );
        }
      );
  }
}


