import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:task_manager/data/model/network_response.dart';

class NetWorkCaller{

  Future<NetworkResponse>getRequest(String url,)async{
    
   try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
         return NetworkResponse(true,response.statusCode, jsonDecode(response.body));
      } else {
       return NetworkResponse(false,response.statusCode,null);
      }
    }catch(e){
     log(e.toString());
   }
   return NetworkResponse(false,-1, null);
  }


  Future<NetworkResponse>postRequest(String url,Map<String,dynamic>body)async{
    Response response = await post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body:jsonEncode(body)
    );
    log(response.statusCode.toString());
    log(response.body);
    try{
      if(response.statusCode==200){
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
      }else{
        return NetworkResponse(false, response.statusCode, null);
      }
    }catch(e){
      log(e.toString());
    }
    return NetworkResponse(false, response.statusCode, null);
  }

}