
import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/model/categoriesmodel.dart';
import '../../data/model/itemsmodel.dart';


class ItemsEditController extends GetxController{

  List<SelectedListItem> dropdownlist = [];
  ItemsData itemsData = ItemsData(Get.find());
  List<ItemsModel> data =[];
  StatusRequest statusRequest = StatusRequest.onitnial;
  late TextEditingController name ;
  late TextEditingController namear ;
  late TextEditingController items_categ ;
  late TextEditingController  items_categid;
  late TextEditingController items_desc ;
  late TextEditingController items_desc_ar ;
  late TextEditingController items_count ;
  late TextEditingController items_price ;
  late TextEditingController items_discount;


  late ItemsModel itemsModel;
  File? file;

  GlobalKey<FormState> formstat = GlobalKey<FormState>();

  @override
  void onInit() {
    intialdata();
    getCate();
    super.onInit();
  }
  intialdata(){
    name = TextEditingController();
    namear = TextEditingController();
    items_categ = TextEditingController();
    items_categid = TextEditingController();
    items_desc = TextEditingController();
    items_desc_ar = TextEditingController();
    items_count = TextEditingController();
    items_price = TextEditingController();
    items_discount = TextEditingController();

    itemsModel = Get.arguments["itemsModel"];
    name.text = itemsModel.itemsName!;
    namear.text = itemsModel.itemsNameAr!;
    items_categ.text = itemsModel.categoriesName.toString();
    items_categid.text = itemsModel.itemsCateg.toString();
    items_desc.text = itemsModel.itemsDesc!;
    items_desc_ar.text = itemsModel.itemsDescAr!;
    items_count.text = itemsModel.itemsCount.toString();
    items_price.text = itemsModel.itemsPrice.toString();
    items_discount.text = itemsModel.itemsDiscount.toString();
  }
  @override
  dispose(){
    super.dispose();
    namear.dispose();
    name.dispose();
    items_categ.dispose();
    items_categid.dispose();
    items_desc.dispose();
    items_desc_ar.dispose();
    items_count.dispose();
    items_price.dispose();
    items_discount.dispose();
  }

  showOptionImage()async{
    file = await showbottommenu(chooseImageCamera ,
        chooseImageGallery);

    update();
  }
  chooseImageGallery()async{
    file = await fileUploadGallery();
    update();
  }
  chooseImageCamera()async{
    file = await imageUploadCamera();
    update();
  }

  editData([File? file])async{
    if(name.text==itemsModel.itemsName&&namear.text== itemsModel.itemsNameAr&&
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
        "categ":items_categid.text,
        "desc":items_desc.text,
        "desc_ar":items_desc_ar.text,
        "count":items_count.text,
        "price":items_price.text,
        "discount":items_discount.text,
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
  getCate()async{
    CategoriesData categoriesData = CategoriesData(Get.find());
    List<CategoriesModel> datacat =[];

    statusRequest =StatusRequest.loading;
    var response =await categoriesData.getData();
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        List reponselist = response['data'];
        datacat.addAll(reponselist.map((e) => CategoriesModel.fromJson(e),));
        for(int i=0;i<datacat.length;i++){
          dropdownlist.add(SelectedListItem(name: datacat[i].categoriesName!,
              value:datacat[i].categoriesId));
        }
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}