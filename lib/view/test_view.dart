
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/test_controller.dart';
import '../core/class/handlingdataview.dart';
import '../core/constant/color.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.primaryColor,
        title: const Text("Test"),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data}");
                },
              ));
        },
      ),
    );
  }
}
