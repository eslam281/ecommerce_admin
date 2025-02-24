
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttittleauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Sign In",
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.grey),
          ),
        ),
        body: PopScope(
          onPopInvoked: (val) {
            alertExitApp();
          },
          canPop: false,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) =>
                HandlingDataRequest(statusRequest: controller.statusRequest,
                  widget: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const LogoAuth(),
                          CustomTextTittleAuth(
                            text: '10'.tr,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextBodyAuth(text: "11".tr),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin:const EdgeInsets.all(3),
                            child: CustomTextFormAuth(
                                type: TextInputType.emailAddress,
                                mycontroller: controller.email,
                                label: "18".tr,
                                hintText: "12".tr,
                                suffixIcon: const Icon(Icons.email_outlined),
                                valid: (val) {
                                  return validInput(val, 5, 30, "email");
                                }),
                          ),
                          Container(
                            margin:const EdgeInsets.all(5),
                            child: CustomTextFormAuth(
                                obscureText: controller.isshowpassword,
                                onTap: () {
                                  controller.showPassword();
                                },
                                type: TextInputType.text,
                                mycontroller: controller.password,
                                label: "13".tr,
                                hintText: "19".tr,
                                suffixIcon: const Icon(Icons.lock_outline),
                                valid: (val) {
                                  return validInput(val, 6, 30, "password");
                                }),
                          ),
                          CustomButtomAuth(
                              onPressed: () {
                                controller.login();
                              },
                              text: "15".tr),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: Text(
                              "14".tr,
                              textAlign: TextAlign.center,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontSize: 17),
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextSing(
                              text: "16".tr,
                              textTwo: "17".tr,
                              onTap: () {
                                controller.goToSignUp();
                              })
                        ],
                      ),
                    ),
                  ),
                ),
          ),
        ));
  }
}
