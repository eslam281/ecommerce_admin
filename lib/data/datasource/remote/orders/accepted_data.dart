
import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';


class AcceptedData{

  Crud crud;

  AcceptedData(this.crud);

  getData()async{
    var response =
    await crud.postData(AppLink.acceptedOrders, {});
    return response.fold((l) => l, (r) => r,);
  }
  doneDelivery(String orderid,String userid,String ordertype)async{
    var response =
    await crud.postData(AppLink.doneOrders, {"orderid":orderid,"userid":userid,"ordertype":ordertype});
    return response.fold((l) => l, (r) => r,);
  }

}