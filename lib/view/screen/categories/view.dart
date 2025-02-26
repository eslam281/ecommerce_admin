import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/categories/view_controller.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put( CategoriesViewController());
    return Scaffold(
      appBar:AppBar(title:const Text("Categories"),),
      body:Container(
        margin:const EdgeInsets.all(10),
        child:GetBuilder<CategoriesViewController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest:controller.statusRequest,
              widget: ListView.builder(itemCount:controller.data.length,
                  itemBuilder: (context, index) {
                var current =controller.data[index];
                return Card(child: Row(
                  children: [
                    Expanded(flex: 2,
                      child: SvgPicture.network("${AppLink.cateimages + current.categoriesImage!}"
                        ,width: 70,)
                    ),
                    Expanded(flex: 4,
                        child:ListTile(title:Text(current.categoriesName!),)),
                  ],
                ));
                  }
                ,),
            );
          }
        ),
      ),

    );
  }
}
