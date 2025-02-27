
import 'dart:io';

import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/categories_data.dart';


class CategoriesAddController extends GetxController{

  CategoriesData categoriesData = CategoriesData(Get.find());
  List<CategoriesModel> data =[];
  StatusRequest statusRequest = StatusRequest.onitnial;
  late TextEditingController name ;
  late TextEditingController namear ;
  late File file;

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

  addData()async{
    if(formstat.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      Map data={
        "name":name.text,
        "namear":namear.text,
      };
      var response = await categoriesData.addData(data,file);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
         Get.offNamed(AppRoute.categoriesview);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

}