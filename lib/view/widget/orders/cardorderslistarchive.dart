
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/archive_controller.dart';
import '../../../controller/orders/pending_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/ordersmodel.dart';


class CardOrdersListArchive extends GetView<ArchiveControllerImp> {
  final OrdersModel listdata;
  const CardOrdersListArchive({super.key, required this.listdata}) ;

  @override
  Widget build(BuildContext context) {
    Get.put(PendingControllerImp());
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style:  const TextStyle(fontFamily:"sans",
                          fontSize: 18, fontWeight: FontWeight.bold,color:AppColor.black2)),
                  const Spacer(),

                  // Text("${Jiffy.parse(listdata.ordersDatetime!).format(pattern: 'MMMM do yyyy')}",
                  Text(Jiffy.parse(listdata.ordersDatetime!, pattern: 'yyyy-MM-dd HH:mm:ss').fromNow(),
                    style: const TextStyle(fontFamily: "sans",
                        color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),

              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text("Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              if(listdata.ordersType==0)
                Text("Address : ${listdata.addressName} "),

              const Divider(),

              Row(children: [
                Text("Total Price : ${listdata.ordersTotalprice} \$ ",
                    style: const TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold,
                        fontFamily:"sans")),
                const Spacer(),

                MaterialButton(onPressed: () {
                  Get.toNamed(AppRoute.ordersdetails,arguments:{"ordersmodel":listdata});
                },
                  color: AppColor.primaryColor, textColor: AppColor.black,
                  child: const Text("Details"),
                ),
              ],
              ),
            ],
          )),
    );
  }
}