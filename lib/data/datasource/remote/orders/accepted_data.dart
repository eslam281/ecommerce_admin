
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';


class AcceptedData{

  Crud crud;

  AcceptedData(this.crud);

  getData(String deliveryid)async{
    var response =
    await crud.postData(AppLink.acceptedOrders, {"deliveryid":deliveryid});
    return response.fold((l) => l, (r) => r,);
  }
  doneDelivery(String orderid,String userid)async{
    var response =
    await crud.postData(AppLink.doneOrders, {"orderid":orderid, "userid":userid,});
    return response.fold((l) => l, (r) => r,);
  }

}