
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:get/get.dart';


import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/categories_data.dart';


class CategoriesViewController extends GetxController{

  CategoriesData categoriesData = CategoriesData(Get.find());
  List<CategoriesModel> data =[];
  late StatusRequest statusRequest ;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData()async{
    data.clear();
    statusRequest =StatusRequest.loading;
    var response =await categoriesData.getData();
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        List reponselist = response['data'];
        data.addAll(reponselist.map((e) => CategoriesModel.fromJson(e),));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  deleteCategory(String id ,String imagename)async{
    var response =await categoriesData.deleteData(id,imagename);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        data.removeWhere((element) => element.categoriesId == id,);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}