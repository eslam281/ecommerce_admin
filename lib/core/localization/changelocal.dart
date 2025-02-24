
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/apptheme.dart';
import '../services/services.dart';

class LocaleController extends GetxController{
  Locale? language;
  MyServices myServices=Get.find();

  ThemeData appTheme=themeEnglish;

  changeLang(String langcode){
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == 'ar'? themeArabic:themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    // requsetPermissionNotification();
    // fcmconfing();
    String? shardedPrefLang = myServices.sharedPreferences.getString("lang");
    if(shardedPrefLang == "ar"){
      language = const Locale("ar");
      appTheme =themeArabic;
    }else if(shardedPrefLang == "en"){
      language =const Locale("en");
      appTheme =themeEnglish;
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}