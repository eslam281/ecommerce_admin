import 'dart:convert';
import 'package:admin/core/class/statusrequest.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';

class Crud{
  Future<Either<StatusRequest,Map>> postData(String linkurl,Map data) async{
    try{
      if(await checkInternet()){
        var response = await http.post(Uri.parse(linkurl),body:data);
        if(response.statusCode == 200||response.statusCode == 201){
          Map responsebody =jsonDecode(response.body);
          return Right(responsebody);
        }else{return const Left(StatusRequest.serverfailure);}
        
      }else{return const Left(StatusRequest.offlinefailure);}

    }catch(_){
      return const Left(StatusRequest.serverfailure);
    }
  }
}