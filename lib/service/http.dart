import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

import '../config/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future request( url, { formData } ) async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    if( formData == null ){
      response = await dio.post( servicePath[url] );
    } else {
      response = await dio.post( servicePath[url] , data: formData);
    }
    if( response.statusCode == 200 ){
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }

  } catch( e ){
    return print("------出错了------------>>>>>${e}");
  }


}


Future requestGet( url, { formData } ) async {
  try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String lovely = pref.getString("De-lovely");
    Response response;
    Dio mdio = Dio();
    mdio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    if( lovely != null ){
      mdio.options.cookies = [ Cookie( 'set-cookie', lovely ) ];
    }
    if( formData == null ){
      response = await mdio.get( servicePath[url] );
    } else {
      response = await mdio.get( servicePath[url], queryParameters: formData );
    }
    if( response.statusCode == 200 || response.statusCode == 201 ){
      // print("------获取成功------------>>>>>请看下一步.......");
      // print("$response");
      print( "---------header里面的数据--------${response.headers.toString()}-----" );
      print( "---------header里面的数据--------${response.headers['set-cookie']}-------${response.headers['cookie']}--" );
      if( response.headers['set-cookie'] != null ){
        // Cookie ss = Cookie( "De-lovely", response.headers['set-cookie'].toString() );
        pref.setString("De-lovely", response.headers['set-cookie'].toString());
      }
      return response.data;
    }else{
      print("------出错了------------>>>>>请检测代码和服务器情况.......");
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch( e ){
    print("------出错了----抛出的错误-------->>>>>${e}");
    return {
      "success" : false
    };
  }


}


class HttpUtil{
  static HttpUtil instance;
  Dio dio;
  Options options;

  static HttpUtil getInstance(){
    print("getInstance");
    if( instance == null ){
      instance = HttpUtil();
    }
    return instance;
  }

  HttpUtil() {
    print("--------初始化--");
    dio = Dio();
    dio.options.baseUrl = "http://132.232.45.108:8888";
    dio.options.connectTimeout = 12000;
    dio.options.receiveTimeout = 4000;
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
  }

  get( url, { data, options } ) async {
    print("---------------get请求启动--");
    Response response;
    try{
      if( data == null ){
        response = await dio.get( servicePath[url] );
      } else {
        response = await dio.get( servicePath[url], queryParameters: data );
      }
      if( response.statusCode == 200 || response.statusCode == 201 ){
        print("------获取成功------------>>>>>请看下一步.......");
        print("$response");
        return response.data;
      }
    }catch(e){}



  }




}









