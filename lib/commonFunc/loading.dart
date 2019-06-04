import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



Widget loading(){
  return Container(
    alignment: Alignment.topCenter,
    child: Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(300)
      ),
      width: double.infinity,
      height: ScreenUtil().setWidth(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              right: ScreenUtil().setWidth(40)
            ),
            height: ScreenUtil().setWidth(70),
            width: ScreenUtil().setWidth(70),
            child: CircularProgressIndicator(
              strokeWidth: 2,
            )
          ),
          Text("加载中...", style: TextStyle( color: Colors.red ), )
        ], 
      )
    )
  );
}


Widget buildProgressIndicator() {
  return new Container(
    height: ScreenUtil().setHeight(200),
    margin: EdgeInsets.only(
      bottom: ScreenUtil().setHeight(30)
    ),
    child: new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(50),
            width: ScreenUtil().setHeight(50),
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: new Text('即将加载更多...'))
        ],
      )
    ),
  );
}

