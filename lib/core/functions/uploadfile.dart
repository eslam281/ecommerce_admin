

import 'dart:io';

import 'package:admin/core/constant/color.dart';
import 'package:admin/core/services/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';




imageUploadCamera()async{

 final  XFile? file = await  ImagePicker().pickImage(source: ImageSource.camera,imageQuality:90) ;
 if(file != null){
   return File(file.path);
 }else{
   return null ;
 }

}


fileUploadGallery([bool isSvg = false])async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type:FileType.custom,
    allowedExtensions:isSvg? ["svg","SVG"]:
    ["PNG","png","jpg","jpeg","gif"],
  );

  if(result != null){
    return File(result.files.single.path!);
  }else{
    return null ;
  }

}

showbottommenu(Function() imageUploadCamera,Function() fileUploadGallery){
  MyServices myServices =Get.find();
  Get.bottomSheet(
    backgroundColor:Colors.white,
    Directionality(
        textDirection:myServices.sharedPreferences.getString("lang")=="en"?
        TextDirection.ltr:TextDirection.rtl

        , child:Container(
      padding: const EdgeInsets.all(10),height:200,
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
        const Text("choose image",style:TextStyle(
          fontSize: 22,fontWeight: FontWeight.bold,color:AppColor.primaryColor
        ),),
          const SizedBox(height: 10,),

          ListTile(
            onTap:(){
              imageUploadCamera();
              Get.back();
            },
            leading:const Icon(Icons.camera_alt,size: 40,),
            title:const Text("take photo",style:TextStyle(fontSize: 20),),
          ),

          ListTile(
            onTap:(){
              fileUploadGallery();
              Get.back();
            },
            leading:const Icon(Icons.image,size: 40,),
            title:const Text("choose photo form gallery",style:TextStyle(fontSize: 20),),
          ),
      ],),
    ))
  );
}