
import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';

class ItemsViewController extends GetxController{

  ItemsData itemsData = ItemsData(Get.find());
  List<ItemsModel> data =[];
  late StatusRequest statusRequest ;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData()async{
    data.clear();
    statusRequest =StatusRequest.loading;
    var response =await itemsData.getData();
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        List reponselist = response['data'];
        data.addAll(reponselist.map((e) => ItemsModel.fromJson(e),));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  deleteCategory(String id ,String imagename)async{
    var response =await itemsData.deleteData(id,imagename);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        data.removeWhere((element) => element.itemsId.toString() == id,);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageEdit(ItemsModel itemsModel){
    Get.toNamed(AppRoute.itemsedit,arguments:{"itemsModel":itemsModel});
  }

}