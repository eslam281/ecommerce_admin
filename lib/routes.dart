
import 'package:admin/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:admin/view/screen/auth/signup.dart';
import 'package:admin/view/screen/auth/success_sinup.dart';
import 'package:admin/view/screen/auth/verfiycodesignup.dart';
import 'package:admin/view/screen/home/home.dart';
import 'package:admin/view/screen/orders/orderscreen.dart';
import 'package:admin/view/screen/initialstart/language.dart';
import 'package:admin/view/screen/initialstart/onboarding.dart';
import 'package:admin/view/screen/orders/details.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';


import 'view/screen/auth/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/verfiycode.dart';
import 'view/screen/auth/login.dart';

List<GetPage<dynamic>>? routes=[
  //language
  GetPage(name: "/", page: ()=>  const Language(),middlewares: [
    MyMiddleWare()
  ]),

  //OnBoarding
  GetPage(name: AppRoute.onBoarding, page: ()=> const OnBoarding()),

  //Auth
  GetPage(name: AppRoute.login, page: ()=> const Login()),
  GetPage(name: AppRoute.signup, page: ()=> const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: ()=> const ForgetPassword()),
  GetPage(name: AppRoute.verFiyCode, page: ()=> const VerFiyCode()),
  GetPage(name: AppRoute.resetPassword, page: ()=> const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword, page: ()=> const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: ()=> const SuccessSinUp()),
  GetPage(name: AppRoute.verFiyCodeSignUp, page: ()=> const VerFiyCodeSignUp()),
  // Home
  GetPage(name: AppRoute.order, page: ()=> const OrderScreen()),
  GetPage(name: AppRoute.home, page: ()=> const Home()),

  GetPage(name: AppRoute.ordersdetails, page: ()=> const OrdersDetails()),

];
