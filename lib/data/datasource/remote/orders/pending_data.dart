
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class OrdersPendingData{

  Crud crud;

  OrdersPendingData(this.crud);

  getData()async{
    var response =
    await crud.postData(AppLink.pending, {});
    return response.fold((l) => l, (r) => r,);
  }
  approveOrders(String orderid,String userid)async{
    var response =
    await crud.postData(AppLink.approveOrders, {
      "orderid":orderid,
      "userid":userid,
    }
    );
    return response.fold((l) => l, (r) => r,);
  }
}