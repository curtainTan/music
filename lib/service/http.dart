import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';


import '../config/server/api.dart';


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
  var pref = await SharedPreferences.getInstance();
  List<Cookie> myCookie = [];
  String c1 = pref.getString("cookie1");
  String c2 = pref.getString("cookie2");
  String c3 = pref.getString("cookie3");
  if( c1 != null ){
    myCookie = [
      Cookie.fromSetCookieValue(c1),
      Cookie.fromSetCookieValue(c2),
      Cookie.fromSetCookieValue(c3)
    ];
  }
  try {
    Response response;
    Dio mdio = Dio();

    if( myCookie.length != 0 ){
      // print("----------携带cookie------${myCookie.toString()}---");
      // print("--有cookie---");
      mdio.options.cookies = myCookie;
      mdio.options.followRedirects = true;
      mdio.head("https://music.163.com/weapi/");
      // xhrFields: { withCredentials: true };
      mdio.options.queryParameters = { "xhrFields" : { "withCredentials": true } };
    }

    mdio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");

    if( formData == null ){
      response = await mdio.get( servicePath[url] );
    } else {
      response = await mdio.get( servicePath[url], queryParameters: formData );
    }
    if( response.statusCode == 200 || response.statusCode == 201 ){
      // print("------------------------>>>>>>基本请求头${response.headers.toString()}");
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


Future requestSetCookie( url, { formData } ) async {
  var pref = await SharedPreferences.getInstance();
  try {
    Response response;
    Dio mdio = Dio();

    mdio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    if( formData == null ){
      response = await mdio.get( servicePath[url] );
    } else {
      response = await mdio.get( servicePath[url], queryParameters: formData );
    }
    if( response.statusCode == 200 || response.statusCode == 201 ){
      
      if( response.headers['set-cookie'] !=  null){

        pref.setString("cookie1", response.headers['set-cookie'][0]);
        pref.setString("cookie2", response.headers['set-cookie'][1]);
        pref.setString("cookie3", response.headers['set-cookie'][2]);
        
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




// class HttpUtil{flutter packages get
//   static HttpUtil instance;
//   Dio dio;
//   Options options;

//   static HttpUtil getInstance(){
//     print("getInstance");
//     if( instance == null ){
//       instance = HttpUtil();
//     }
//     return instance;
//   }

//   HttpUtil() {
//     print("--------初始化--");
//     dio = Dio();
//     dio.options.baseUrl = "http://132.232.45.108:8888";
//     dio.options.connectTimeout = 12000;
//     dio.options.receiveTimeout = 4000;
//     dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
//   }

//   get( url, { data, options } ) async {
//     print("---------------get请求启动--");
//     Response response;
//     try{
//       if( data == null ){
//         response = await dio.get( servicePath[url] );
//       } else {
//         response = await dio.get( servicePath[url], queryParameters: data );
//       }
//       if( response.statusCode == 200 || response.statusCode == 201 ){
//         print("------获取成功------------>>>>>请看下一步.......");
//         print("$response");
//         return response.data;
//       }
//     }catch(e){}



//   }




// }









