import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/initialbindings.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language,
      translations:MyTranslation(),
      title: 'Flutter Demo',
      theme:controller.appTheme,
      // home:  //to run from routes ("/") to active middleware
      // const Language(),
      // const TestView(),
      // routes:routes, Flutter built in don't use it use  getPages: [] in GetX
      getPages: routes,
      initialBinding:InitialBindings(),
    );
  }
}
