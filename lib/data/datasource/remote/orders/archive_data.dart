

import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';


class OrdersArchiveData{

  Crud crud;

  OrdersArchiveData(this.crud);

  getData()async{
    var response =
    await crud.postData(AppLink.archive, {});
    return response.fold((l) => l, (r) => r,);
  }


}