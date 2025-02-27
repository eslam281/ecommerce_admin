import 'package:admin/core/constant/color.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:admin/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/categories/add_controller.dart';
import '../../../core/functions/uploadfile.dart';
import '../../../core/functions/validinput.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesAddController());
    return Scaffold(
      appBar:AppBar(title:const Text("Add Category"),),
      body:GetBuilder<CategoriesAddController>(
        builder: (controller) {
          return Container(
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
                    mycontroller: controller.name, valid:(v0) => validInput(v0,4,50,"name") ,
                    type:TextInputType.name),

                Container(
                  padding:const EdgeInsets.all(20),
                    child: MaterialButton(color:AppColor.grey,
                      onPressed: (){controller.chooseImage();},child: const Text("choose category image",
                        style:TextStyle(fontSize: 18),),)),

                if(controller.file != null)
                  SvgPicture.file(controller.file),

                CustomButtomAuth(onPressed:() =>controller.addData(), text: "Add")
              ],),
            ),
          );
        }
      ),
    );
  }
}
