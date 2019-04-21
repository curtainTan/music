import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:music/views/hero/decration.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';



class ThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Center(
      //   child: GestureDetector(
      //     onTap: (){
      //       Navigator.of(context).push( MaterialPageRoute(
      //         builder: (_){
      //           return HeroPage();
      //         }
      //       ) );
      //     },
      //     child: Hero(
      //       tag: "tty",
      //       child: Container(
      //         height: ScreenUtil().setHeight(600),
      //         width: ScreenUtil().setWidth(600),
      //         color: Colors.black12,
      //       ),
      //     ),
      //   ),
      // ),
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(300),
                width: ScreenUtil().setHeight(300),
                color: Colors.orange,
                child: SpinKitRotatingPlain(
                  color: Colors.red,
                  size: 30,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(300),
                width: ScreenUtil().setHeight(300),
                color: Colors.grey,
                child: SpinKitThreeBounce(
                  color: Colors.green,
                  size: 30,
                )
              ),
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(300),
                width: ScreenUtil().setHeight(300),
                color: Colors.red,
                child: Column(
                  children: <Widget>[
                    SpinKitCircle(
                      color: Colors.white,
                      size: 30,
                    ),
                    Text("加载中......", style: TextStyle( color: Colors.white ),)
                  ],
                )
              ),
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(300),
                width: ScreenUtil().setHeight(300),
                color: Colors.yellow,
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(

                    ),
                    Text("加载中......", style: TextStyle( color: Colors.white ),)
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}










