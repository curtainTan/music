import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class SingerAbout extends StatelessWidget {

  String headImg, mvUser;

  SingerAbout({ this.headImg, this.mvUser });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(120),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(40),
        vertical: ScreenUtil().setHeight( 15 )
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide( color: Colors.black12, width: ScreenUtil().setWidth(3), )
        ),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                // Container(
                //   height: ScreenUtil().setHeight( 100 ),
                //   width: ScreenUtil().setHeight( 100 ),
                  // child: 
                  ClipOval(
                    child: Image.network( headImg ?? "http://curtaintan.club/headImg/1549358122065.jpg" ),
                  ),
                // ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth( 20 )
                  ),
                  child: Text( mvUser , style: TextStyle( fontSize: ScreenUtil().setSp( 40 ) ),),
                )
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth( 160 ),
            height: ScreenUtil().setHeight(80),
            child: FlatButton(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth( 20 )
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all( Radius.circular( 20 ) )
              ),
              color: Colors.red,
              onPressed: (){},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon( Icons.add, color: Colors.white, size: ScreenUtil().setSp( 38 ), ),
                  Text("关注", style: TextStyle( color: Colors.white, fontSize: ScreenUtil().setSp( 32 ) ),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}













