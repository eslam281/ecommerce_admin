
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
  late TextEditingController items_categ ;
  late TextEditingController items_desc ;
  late TextEditingController items_desc_ar ;
  late TextEditingController items_count ;
  late TextEditingController items_price ;
  late TextEditingController items_discount ;


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
    items_categ = TextEditingController();
    items_desc = TextEditingController();
    items_desc_ar = TextEditingController();
    items_count = TextEditingController();
    items_price = TextEditingController();
    items_discount = TextEditingController();

    itemsModel = Get.arguments["itemsModel"];
    name.text = itemsModel.itemsName!;
    namear.text = itemsModel.itemsNameAr!;
    items_categ.text = itemsModel.itemsCateg.toString();
    items_desc.text = itemsModel.itemsDesc!;
    items_desc_ar.text = itemsModel.itemsDescAr!;
    items_count.text = itemsModel.itemsCount.toString();
    items_price.value = itemsModel.itemsPrice;
    items_discount.text = itemsModel.itemsDiscount.toString();
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
        "imagenameold":itemsModel.itemsImage,
        "name":name.text,
        "namear":namear.text,
        "items_categ":items_categ.text,
        "items_desc":items_desc.text,
        "items_desc_ar":items_desc_ar.text,
        "items_count":items_count.text,
        // "items_active":items_active.text,
        "items_price":items_price.text,
        "items_discount":items_discount.text,
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