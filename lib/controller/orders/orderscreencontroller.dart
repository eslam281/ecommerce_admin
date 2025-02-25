
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/orders/accepted.dart';
import '../../view/screen/orders/archive.dart';
import '../../view/screen/orders/pending.dart';
import '../../view/screen/settings/settings.dart';




abstract class OrderScreenController extends GetxController {
  changePage(int i);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    const Pending(),
    const OrdersAccepted(),
    const Archive(),
  ];
  List<Map> bottomappbat = [
    {"title": "pending", "icon": Icons.padding_rounded},
    {"title": "Accepted", "icon": Icons.delivery_dining},
    {"title": "archive", "icon": Icons.archive},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
