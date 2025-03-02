import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:admin/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items/edit_controller.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/shared/customdropdownsearch.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsEditController());
    return Scaffold(
      appBar:AppBar(title:const Text("Edit Items"),),
      body:GetBuilder<ItemsEditController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest:controller.statusRequest,
              widget: Container(
                padding:const EdgeInsets.all(15),
                child:Form(
                  key:controller.formstat ,
                  child: ListView(children: [
                    const SizedBox(height: 15,),

                    CustomTextFormGlobal(label: "Category name", suffixIcon: const Icon(Icons.add),
                        mycontroller: controller.name, valid:(v0) => validInput(v0,4,50,"name") ,
                        type:TextInputType.name),
                    const SizedBox(height: 10,),

                    CustomTextFormGlobal(label: "Category name (Arabic)", suffixIcon: const Icon(Icons.add),
                        mycontroller: controller.namear, valid:(v0) => validInput(v0,4,50,"name") ,
                        type:TextInputType.name),

                    CustomTextFormGlobal(label: "item description", suffixIcon: const Icon(Icons.add),
                        mycontroller: controller.items_desc, valid:(v0) => validInput(v0,4,1000,"name") ,
                        type:TextInputType.name),

                    CustomTextFormGlobal(label: "item description (Arabic)", suffixIcon: const Icon(Icons.add),
                        mycontroller: controller.items_desc_ar, valid:(v0) => validInput(v0,4,1000,"name") ,
                        type:TextInputType.name),

                    CustomTextFormGlobal(label: "item count", suffixIcon: const Icon(Icons.add),
                        mycontroller: controller.items_count, valid:(v0) => validInput(v0,0,10000000000,"number") ,
                        type:TextInputType.number),

                    CustomTextFormGlobal(label: "items price", suffixIcon: const Icon(Icons.add),
                        mycontroller: controller.items_price, valid:(v0) => validInput(v0,1,10000000000,"number") ,
                        type:TextInputType.number),

                    CustomTextFormGlobal(label: "discount", suffixIcon: const Icon(Icons.add),
                        mycontroller: controller.items_discount, valid:(v0) => validInput(v0,0,3,"name") ,
                        type:TextInputType.number),

                    CustomDropDownSearch(hintText: controller.items_categ.text,title:"choose",
                        dropdownSelectedName:controller.items_categ, dropdownSelectedId:controller.items_categid,
                        listdata:controller.dropdownlist),

                    const SizedBox(height: 10,),

                    RadioListTile(title:const Text("Active"),
                      value: "1", groupValue:controller.active ,onChanged: (value) {
                      controller.changeStatusActive(value);
                    },),

                    RadioListTile(title:const Text("Hide"),
                      value: "0", groupValue:controller.active,onChanged: (value) {
                      controller.changeStatusActive(value);
                    },),

                    const SizedBox(height: 10,),

                    Container(
                        padding:const EdgeInsets.all(20),
                        child: MaterialButton(color:AppColor.grey,
                          onPressed: (){controller.showOptionImage();},child: const Text("choose category image",
                            style:TextStyle(fontSize: 18),),)),

                    if(controller.file != null)
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.file(controller.file!,width: 50,)),


                    CustomButtomAuth(onPressed:() =>controller.editData(), text: "Edit")
                  ],),
                ),
              ),
            );
          }
      ),
    );
  }
}
