
import 'dart:io';

import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/categories_data.dart';


class CategoriesAddController extends GetxController{

  CategoriesData categoriesData = CategoriesData(Get.find());
  List<CategoriesModel> data =[];
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
    file = await fileUploadGallery(true);
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
      var response = await categoriesData.addData(data,file!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          CategoriesViewController c =Get.find();
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