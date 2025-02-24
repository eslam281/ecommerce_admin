

import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class VerFiyCode{

  Crud crud;

  VerFiyCode(this.crud);

  postData(String email,String verifycode,)async{
    var response =
    await crud.postData(AppLink.verfiycode_password, {
      "email":email,
      "verfiycode":verifycode,
    });
    print("====$email==============$verifycode");
    return response.fold((l) => l, (r) => r,);
  }
}