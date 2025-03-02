
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/pending_data.dart';
import '../../data/model/ordersmodel.dart';


abstract class PendingController extends GetxController{
  getData();
  String printPaymentMethod(int val);
}
class PendingControllerImp extends PendingController{

  OrdersPendingData pendingData = OrdersPendingData(Get.find());
  List<OrdersModel> data =[];
  StatusRequest statusRequest =StatusRequest.onitnial ;
  MyServices myServices = Get.find();


  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData()async{
    data.clear();
    statusRequest =StatusRequest.loading;
    var response =await pendingData.getData();
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        List responedata = response['data'];
        data.addAll(responedata.map((e) => OrdersModel.fromJson(e),));
        data =data.reversed.toList();
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  approve(String userid,String orderid)async{
    data.clear();
    statusRequest =StatusRequest.loading;
    var response =await pendingData.approveOrders(orderid,userid);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        getData();
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  String printPaymentMethod(int val) {
    return (val == 0)? "Cash On Delivery": "Payment Card";
  }

  String printOrdertype(int val) {
    return (val == 0)? "Delivery": "Receive";
  }

}