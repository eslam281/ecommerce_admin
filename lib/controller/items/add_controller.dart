
import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/items_data.dart';


class ItemsAddController extends GetxController{

  ItemsData itemsData = ItemsData(Get.find());
  List<ItemsModel> data =[];
  StatusRequest statusRequest = StatusRequest.onitnial;
  late TextEditingController name ;
  late TextEditingController namear ;
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

  addData()async{
    if(formstat.currentState!.validate()) {
      if(file == null) return Get.snackbar("waring", " choose image");
      statusRequest = StatusRequest.loading;
      Map data={
        "name":name.text,
        "namear":namear.text,
      };
      var response = await itemsData.addData(data,file!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          ItemsViewController c =Get.find();
          await c.getData();
          Get.back();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

}