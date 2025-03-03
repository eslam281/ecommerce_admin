
import 'package:admin/controller/orders/pending_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/orders/accepted.dart';
import '../../view/screen/orders/archive.dart';
import '../../view/screen/orders/pending.dart';
import 'accepted_controller.dart';
import 'archive_controller.dart';




abstract class OrderScreenController extends GetxController {
  changePage(int i);
}

class OrderScreenControllerImp extends OrderScreenController {

  PendingControllerImp pendingcontroller =  Get.put(PendingControllerImp());
  AcceptedControllerImp acceptedcontroller =  Get.put(AcceptedControllerImp());
  ArchiveControllerImp archivecontroller = Get.put(ArchiveControllerImp());
  int currentpage = 0;
  List<Widget> listpage = [
    const Pending(),
    const OrdersAccepted(),
    const Archive(),
  ];
  List<Map> bottomappbat = [
    {"title": "pending", "icon": Icons.padding_rounded},
    {"title": "Accepted", "icon": Icons.done_outline_outlined},
    {"title": "archive", "icon": Icons.archive},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    if(i==0)pendingcontroller.getData();
    if(i==1)acceptedcontroller.getData();
    if(i==2)archivecontroller.getData();
    update();
  }
  @override
  void onInit() {
    pendingcontroller.getData();
    super.onInit();
  }
}
