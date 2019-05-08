import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class SearchSuggest extends StatelessWidget {

  final functionShow;
  SearchSuggest({ this.functionShow });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: ( x ){
        // print("_----tab高度---$kToolbarHeight---------scroll高度--${ ScreenUtil().setHeight(1800) - kToolbarHeight }------单个item高度---${ScreenUtil().setHeight(150)}");
        // print("抬手位置-------${ x.globalPosition.dx }---${ x.globalPosition.dy }---${ x.globalPosition.distance }");
        if( x.globalPosition.dx > ScreenUtil().setWidth(100) && 
            x.globalPosition.dx < ScreenUtil().setWidth( 680 ) &&
            x.globalPosition.dy < ( ScreenUtil().setHeight(1820) - kToolbarHeight - ScreenUtil().setHeight(150) * 10 ) ){
          print("在内部点击");
        } else {
          print("在外部--点击");
          functionShow();
        }
      },
      child: SafeArea(
        child: Container(
          width: ScreenUtil().setWidth(1080),
          margin: EdgeInsets.only( 
            top: (kToolbarHeight + ScreenUtil().setHeight(20) )
          ),
          height: ScreenUtil().setHeight(1820) - kToolbarHeight ,
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(100),
            right: ScreenUtil().setWidth(400),
            bottom: ( ScreenUtil().setHeight(1820) - kToolbarHeight - ScreenUtil().setHeight(150) * 10 )
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.all( Radius.circular( 6 ) ),
            child: ListView.builder(
              padding: EdgeInsets.only(),
              itemExtent: ScreenUtil().setHeight(150),
              itemCount: 10,
              itemBuilder: ( context, index ){
                return ListTile(
                  onTap: (){},
                  title: Text("----这里是第$index 个数据--", style: TextStyle( fontSize: 12, decoration: TextDecoration.none ),),
                );
              },
            )
          )
        )
      )
    );
  }
}






















