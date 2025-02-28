import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:admin/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items/add_controller.dart';
import '../../../core/functions/validinput.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAddController());
    return Scaffold(
      appBar:AppBar(title:const Text("Add Item"),),
      body:GetBuilder<ItemsAddController>(
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
                      mycontroller: controller.items_desc, valid:(v0) => validInput(v0,4,50,"name") ,
                      type:TextInputType.name),

                  CustomTextFormGlobal(label: "item description (Arabic)", suffixIcon: const Icon(Icons.add),
                      mycontroller: controller.items_desc_ar, valid:(v0) => validInput(v0,4,50,"name") ,
                      type:TextInputType.name),

                  CustomTextFormGlobal(label: "item count", suffixIcon: const Icon(Icons.add),
                      mycontroller: controller.items_count, valid:(v0) => validInput(v0,0,10000000000,"number") ,
                      type:TextInputType.name),

                  CustomTextFormGlobal(label: "items price", suffixIcon: const Icon(Icons.add),
                      mycontroller: controller.items_price, valid:(v0) => validInput(v0,1,10000000000,"number") ,
                      type:TextInputType.name),

                  CustomTextFormGlobal(label: "discount", suffixIcon: const Icon(Icons.add),
                      mycontroller: controller.items_discount, valid:(v0) => validInput(v0,0,3,"name") ,
                      type:TextInputType.name),

                  TextFormField(
                      controller: controller.items_categ,
                      cursorColor: Colors.black,
                      readOnly: true,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        controller.showDropdownList(context);
                      },
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        contentPadding: const EdgeInsets.only(
                          left: 8,
                          bottom: 0,
                          top: 0,
                          right: 15,
                        ),
                        hintText:controller.items_categ.text==""? "choose category":
                        controller.items_categ.text,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                  ),


                  Container(
                    padding:const EdgeInsets.all(20),
                      child: MaterialButton(color:AppColor.grey,
                        onPressed: (){controller.showOptionImage();},child: const Text("choose category image",
                          style:TextStyle(fontSize: 18),),)),

                  if(controller.file != null)
                  Container(
                    margin: const EdgeInsets.all(10),
                      child: Image.file(controller.file!,width: 50,)),

                  CustomButtomAuth(onPressed:() =>controller.addData(), text: "Add")
                ],),
              ),
            ),
          );
        }
      ),
    );
  }
}
