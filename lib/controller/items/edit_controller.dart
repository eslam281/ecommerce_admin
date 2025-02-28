
import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/model/itemsmodel.dart';


class ItemsEditController extends GetxController{

  ItemsData itemsData = ItemsData(Get.find());
  List<ItemsModel> data =[];
  StatusRequest statusRequest = StatusRequest.onitnial;
  late TextEditingController name ;
  late TextEditingController namear ;
  late ItemsModel itemsModel;
  File? file;

  GlobalKey<FormState> formstat = GlobalKey<FormState>();

  @override
  void onInit() {
    intialdata();
    super.onInit();
  }
  intialdata(){
    name = TextEditingController();
    namear = TextEditingController();
    itemsModel = Get.arguments["itemsModel"];
    name.text = itemsModel.categoriesName!;
    namear.text = itemsModel.categoriesNameAr!;
  }
  @override
  dispose(){
    super.dispose();
    namear.dispose();
    name.dispose();
  }

  chooseImage()async{
    file = await fileUploadGallery();
    update();
  }

  editData([File? file])async{
    if(name.text==itemsModel.categoriesName&&namear.text== itemsModel.categoriesNameAr&&
        file == null) {
      return Get.snackbar("Warning", "Nothing different data to update",padding:const EdgeInsets.all(20));
    }
    if(formstat.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      Map data={
        "id":itemsModel.itemsId,
        "name":name.text,
        "namear":namear.text,
        "imagename":itemsModel.itemsImage,
      };
      var response = await itemsData.editData(data,file);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          ItemsViewController c =Get.find();
          await c.getData();
          Get.back();
        } else {

          // statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

}