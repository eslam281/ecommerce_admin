
import 'dart:io';

import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../data/model/categoriesmodel.dart';


class ItemsAddController extends GetxController{

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

  File? file;

  GlobalKey<FormState> formstat = GlobalKey<FormState>();

  @override
  void onInit() {
    getData();
    intialdata();
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
  getData()async{
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

  addData()async{
    if(formstat.currentState!.validate()) {
      if(file == null) return Get.snackbar("waring", " choose image");
      statusRequest = StatusRequest.loading;
      Map data={
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
  showDropdownList(context)async{
    CategoriesViewController c = Get.put(CategoriesViewController());
     List<SelectedListItem> listOfCities =[];
    await c.getData();

     listOfCities.addAll( c.data.map((e) =>
         SelectedListItem(name: e.categoriesName!),));
    DropDownState(
      dropDown: DropDown(
        data: listOfCities,
        onSelected: (selectedItems) {
          SelectedListItem selectedListItem = selectedItems[0];
          items_categ.text = selectedListItem.name;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                selectedListItem.name.toString(),
              ),
            ),
          );
        },

      ),
    ).showModal(context);
  }

}