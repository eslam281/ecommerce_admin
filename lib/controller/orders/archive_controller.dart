
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/archive_data.dart';
import '../../data/model/ordersmodel.dart';


abstract class ArchiveController extends GetxController{
  getData();
  String printPaymentMethod(int val);
}
class ArchiveControllerImp extends ArchiveController{

  OrdersArchiveData orderData = OrdersArchiveData(Get.find());
  List<OrdersModel> data =[];
  StatusRequest statusRequest =StatusRequest.onitnial ;
  MyServices myServices = Get.find();


  @override
  getData()async{
    data.clear();
    statusRequest =StatusRequest.loading;
    var response =await orderData.getData();
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

  @override
  String printPaymentMethod(int val) {
    return (val == 0)? "Cash On Delivery": "Payment Card";
  }

}