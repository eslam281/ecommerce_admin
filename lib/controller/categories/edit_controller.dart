
import 'dart:io';

import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/model/categoriesmodel.dart';


class CategoriesEditController extends GetxController{

  CategoriesData categoriesData = CategoriesData(Get.find());
  List<CategoriesModel> data =[];
  StatusRequest statusRequest = StatusRequest.onitnial;
  late TextEditingController name ;
  late TextEditingController namear ;
  late CategoriesModel categoriesModel;
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
    categoriesModel = Get.arguments["categoriesModel"];
    name.text = categoriesModel.categoriesName!;
    namear.text = categoriesModel.categoriesNameAr!;
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

  editData([File? file])async{
    if(formstat.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      Map data={
        "id":categoriesModel.categoriesId,
        "name":name.text,
        "namear":namear.text,
        "imagename":categoriesModel.categoriesImage,
      };
      var response = await categoriesData.editData(data,file);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          CategoriesViewController c =Get.find();
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