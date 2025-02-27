import 'dart:convert';
import 'dart:io';
import 'package:admin/core/class/statusrequest.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

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

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(String url, Map data
      , File? image, [String? namerequest]) async {
    namerequest ??= "files";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    // request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }

}


