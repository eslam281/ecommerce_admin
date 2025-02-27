import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../core/constant/linkapi.dart';

class CategoriesData{
  Crud crud;

  CategoriesData(this.crud);

  getData()async{
    var response =
    await crud.postData(AppLink.categoriesview, {});
    return response.fold((l) => l, (r) => r,);
  }

  addData(Map data,File file)async{
    var response =
    await crud.addRequestWithImageOne(AppLink.categoriesadd, data,file);
    return response.fold((l) => l, (r) => r,);
  }

  editData(Map data)async{
    var response =
    await crud.postData(AppLink.categoriesedit, data);
    return response.fold((l) => l, (r) => r,);
  }

  deleteData(String id,String imagename)async{
    var response =
    await crud.postData(AppLink.categoriesdelete, {"id":id, "imagename":imagename,});
    return response.fold((l) => l, (r) => r,);
  }
}