import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart'as http;

import 'base_url.dart';
class ApisServices {
  Future postApiDataWithToken(Map body,String endPoint,token)async{
    final url=Uri.parse(BaseUrl.url+endPoint);
    String jsonBody=jsonEncode(body);
    final enCoding = Encoding.getByName('utf-8');
   final  headers={"Content-Type":"application/json",
     'Authorization': 'Bearer $token',
   };
   try{
     http.Response response=await http.post(url,headers:headers ,body: jsonBody,encoding:enCoding )
         .timeout(const Duration(seconds: 30),onTimeout:(){
           throw TimeoutException("Connection time out plz try again");
     });
     log("Response ${response.body}");
     log("Response ${response.statusCode}");
     return response;

   }on TimeoutException catch (e){
     log("Time out occurred $e");
     return null;
   }
    on SocketException catch (e){
      log("Socket error$e");
      return null;
    }
  }
  Future getApiData( String endPoint) async {
    final url = Uri.parse(BaseUrl.url + endPoint);
    log("api url is: ${url}");
    final headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token',
    };
    try {
      http.Response response = await http
          .get(url, headers: headers,)
          .timeout(
          const Duration(
            seconds: 30,
          ), onTimeout: () {
        throw TimeoutException('Connection TimeOut! please try again');
      });
      // if(response.statusCode==200){
      //   var data=jsonDecode(response.body);
      //   log('$data');
      //
      //   return response.body;
      // }else{
      //   return null;
      // }
      return response.body;
    } on TimeoutException catch(error) {
      log('TimeOut Occurred $error');
      return null;

    }on SocketException catch (error){
      log('Socket Error $error');
      return null;
    }
  }
}