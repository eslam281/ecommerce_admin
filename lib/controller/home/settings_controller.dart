
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/services/services.dart';

abstract class SettingsController extends GetxController{
  logout();
}
class SettingsControllerImp extends SettingsController{
  MyServices myServices = Get.find();

  @override
  logout() {
    String? id =myServices.sharedPreferences.getString("id");
    FirebaseMessaging.instance.unsubscribeFromTopic("delivery");


    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.lang);
  }

}