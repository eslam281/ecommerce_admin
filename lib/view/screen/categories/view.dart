import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/linkapi.dart';
import 'package:admin/core/constant/routes.dart';
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
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.categoriesadd);
      },
      child:const Icon(Icons.add),),
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
                      child: SvgPicture.network(AppLink.cateimages + current.categoriesImage!
                        ,width: 70,)
                    ),
                    Expanded(flex: 3,
                        child:ListTile(title:Text(current.categoriesName!),
                        subtitle: Text(current.categoriesDatatime!),
                        trailing: IconButton(icon:const Icon( Icons.delete_forever_outlined,color: Colors.red,),
                        onPressed:(){
                          Get.defaultDialog(title:"waring",middleText:"are you sure",
                              onConfirm: (){controller.deleteCategory(current.categoriesId,
                                  current.categoriesImage!);
                            Get.back();
                            },
                              onCancel: (){},
                          );
                        } ,),
                        onTap:(){controller.goToPageEdit(current);},)
                    ),
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
