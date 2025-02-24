
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class DetailsData{

  Crud crud;

  DetailsData(this.crud);

  getData(String orderid)async{
    var response =
    await crud.postData(AppLink.ordersdetails, {"orderid":orderid});
    return response.fold((l) => l, (r) => r,);
  }
}