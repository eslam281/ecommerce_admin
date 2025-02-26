//
// import 'package:get/get.dart';
//
//
// import '../../core/class/statusrequest.dart';
// import '../../core/functions/handlingdata.dart';
//
//
// class TestController extends GetxController{
//
//   TestData testData = TestData(Get.find());
//   List data =[];
//   late StatusRequest statusRequest ;
//
//   getData()async{
//     statusRequest =StatusRequest.loading;
//     var response =await testData.getData();
//     statusRequest =handlingData(response);
//     if(statusRequest == StatusRequest.success){
//       if(response['status']=="success"){
//         data.addAll(response['data']);
//       }else{
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }
//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }
// }