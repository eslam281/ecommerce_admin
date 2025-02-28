import 'dart:io';

import 'package:admin/core/class/statusrequest.dart';

import 'package:dartz/dartz.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/linkapi.dart';

class ItemsData{
  Crud crud;

  ItemsData(this.crud);

  getData()async{
    var response =
    await crud.postData(AppLink.itemsview, {});
    return response.fold((l) => l, (r) => r,);
  }

  addData(Map data,File file)async{
    var response =
    await crud.addRequestWithImageOne(AppLink.itemsadd, data,file);
    return response.fold((l) => l, (r) => r,);
  }

  editData(Map data,[File? file])async{
    Either<StatusRequest, Map> response;
    (file == null)?
    response = await crud.postData(AppLink.itemsedit, data)
        :
    response = await crud.addRequestWithImageOne(AppLink.categoriesedit, data,file);

    return response.fold((l) => l, (r) => r,);
  }

  deleteData(String id,String imagename)async{
    var response =
    await crud.postData(AppLink.itemsdelete, {"id":id, "imagename":imagename,});
    return response.fold((l) => l, (r) => r,);
  }
}