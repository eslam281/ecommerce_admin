
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/pending_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/orders/orderspendinglistcard.dart';

class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingControllerImp());
    return Scaffold(
        appBar: AppBar(title:const Text("Orders"),),
        body: GetBuilder<PendingControllerImp>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: ((context, index) {
                     return Column(
                       children: [
                         CardOrdersList(listdata: controller.data[index]),
                         const SizedBox(height: 20,)
                       ],
                     );
                  }
                )),
          ));
        }));
  }
}
