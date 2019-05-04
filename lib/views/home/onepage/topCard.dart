import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';


import 'package:music/provider/me.dart';

class TopCard extends StatelessWidget {


  Widget cardLeft( img, name ){
      // var img = Provide.value<MeInfoProvide>(context).profile?.avatarUrl;
      // if( img == null ){
      //   img = "http://curtaintan.club/headImg/1549358122065.jpg";
      // }
      return Container(
        child: Row(
          children: <Widget>[
            ClipOval(
              child: Image.network(
                img ?? "http://curtaintan.club/headImg/1549358122065.jpg",
                width: ScreenUtil().setWidth(130),
                height: ScreenUtil().setWidth(130),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(30),
            ),
            Text( name ?? "至死不渝的回答", style: TextStyle( fontSize: ScreenUtil().setSp(40) ),)
          ],
        ),
      );
    }

    Widget cardRight(){
      return Container(
        width: ScreenUtil().setWidth(210),
        height: ScreenUtil().setHeight(80),
        child: FlatButton(
          onPressed: (){
            print("签到");
          },
          textColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20),
            side: BorderSide(
              width: 1.0,
              color: Colors.red
            )
          ),
          child: Text("开通会员", style: TextStyle( fontSize: ScreenUtil().setSp(28) ), ),
        )
      );
    }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(100),
          width: ScreenUtil().setWidth(1080),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
        Opacity(
          opacity: 0.9,
          child: Provide<MeInfoProvide>(
            builder: ( context, child, data ){
              return Container(
                height: ScreenUtil().setHeight(200),
                width: ScreenUtil().setWidth(1080),
                margin: EdgeInsets.only(left: 10, right: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all( Radius.circular(6) ),
                  boxShadow: [
                    BoxShadow( offset: Offset(0, 4.0), color: Colors.black12, blurRadius: 5 )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    cardLeft( data?.profile?.avatarUrl, data?.profile?.nickname ),
                    cardRight()
                  ],
                ),
              );
            },
          )
        )
      ],
    );
  }
}



















