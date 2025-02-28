import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/linkapi.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put( ItemsViewController());
    return Scaffold(
      appBar:AppBar(title:const Text("Categories"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.itemsadd);
      },
      child:const Icon(Icons.add),),
      body:Container(
        margin:const EdgeInsets.all(10),
        child:GetBuilder<ItemsViewController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest:controller.statusRequest,
              widget: ListView.builder(itemCount:controller.data.length,
                  itemBuilder: (context, index) {
                var current =controller.data[index];
                return Card(child: Row(
                  children: [
                    Expanded(flex: 2,
                      child: CachedNetworkImage(imageUrl: AppLink.itemsimages+current.itemsImage!)
                    ),
                    Expanded(flex: 3,
                        child:ListTile(title:Text(current.itemsName!),
                        subtitle: Text(current.itemsDate!),
                        trailing: IconButton(icon:const Icon( Icons.delete_forever_outlined,color: Colors.red,),
                        onPressed:(){
                          Get.defaultDialog(title:"waring",middleText:"are you sure",
                              onConfirm: (){controller.deleteCategory(current.itemsId.toString(),
                                  current.itemsImage!);
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
