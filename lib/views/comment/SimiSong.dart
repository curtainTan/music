import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class SimiSongBox extends StatelessWidget {

  Widget titleBox(){
    return Container(
      height: ScreenUtil().setHeight( 90 ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("相关推荐", style: TextStyle( fontSize: ScreenUtil().setSp( 32 ), fontWeight: FontWeight.bold ),),
          InkWell(
            onTap: (){

            },
            child: Container(
              width: ScreenUtil().setWidth( 180 ),
              child: Row(
                children: <Widget>[
                  Text("更多", style: TextStyle( fontSize: ScreenUtil().setSp( 30 ) ), ),
                  Icon( IconData( 0xe65f, fontFamily: "iconfont" ), size: ScreenUtil().setSp( 40 ), )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget oneItem(){
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        height: ScreenUtil().setHeight( 150 ),
        width: ScreenUtil().setWidth( 580 ),
        margin: EdgeInsets.only(
          right: ScreenUtil().setWidth( 30 )
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 4 ),
          color: Colors.white.withOpacity( 0.3 )
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight( 150 ),
              width: ScreenUtil().setHeight( 150 ),
              margin: EdgeInsets.only(
                right: ScreenUtil().setWidth( 20 )
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("http://curtaintan.club/headImg/1549358122065.jpg"),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular( 4 ),
                  topLeft: Radius.circular( 4 ),
                )
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("title", style: TextStyle( fontSize: ScreenUtil().setSp( 38 ) ),),
                  Text("作者和专辑", style: TextStyle( fontSize: ScreenUtil().setSp( 32 ), color: Colors.grey ), )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight( 250 ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth( 30 )
      ),
      child: Column(
        children: <Widget>[
          titleBox(),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: ( context, index ){
              return oneItem(  );
            },
            itemExtent: ScreenUtil().setHeight( 150 ),
          )
        ],
      ),
    );
  }
}








