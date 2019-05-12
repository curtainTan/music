import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'package:music/provider/searchPageProvide.dart';


class SearchSuggest extends StatelessWidget {

  final functionShow;
  final functionInput;
  final inputController;
  SearchSuggest({ this.functionShow, this.functionInput, this.inputController });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: ( x ){
        // print("_----tab高度---$kToolbarHeight---------scroll高度--${ ScreenUtil().setHeight(1800) - kToolbarHeight }------单个item高度---${ScreenUtil().setHeight(150)}");
        // print("抬手位置-------${ x.globalPosition.dx }---${ x.globalPosition.dy }---${ x.globalPosition.distance }");
        if( x.globalPosition.dx > ScreenUtil().setWidth(100) && 
            x.globalPosition.dx < ScreenUtil().setWidth( 680 ) &&
            x.globalPosition.dy < ( ScreenUtil().setHeight(1820) - kToolbarHeight - ScreenUtil().setHeight(150) * 11 ) ){
          print("在内部点击");
        } else {
          print("在外部--点击");
          functionShow();
        }
      },
      child: SafeArea(
        child: Provide<SearchPageProvide>(
          builder: ( context, child, data ){
            return Container(
              width: ScreenUtil().setWidth(1080),
              margin: EdgeInsets.only( 
                top: (kToolbarHeight + ScreenUtil().setHeight(20) )
              ),
              height: ScreenUtil().setHeight(1820) - kToolbarHeight ,
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(100),
                right: ScreenUtil().setWidth(400),
                bottom: ScreenUtil().setHeight(1820) - kToolbarHeight - ScreenUtil().setHeight(150) * ( data.searchSugMobileList.length  ?? 6 )
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
                  itemCount: data.searchSugMobileList.length,
                  itemBuilder: ( context, index ){
                    return InkWell(
                      onTap: (){
                        functionInput( data.searchSugMobileList[index] );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(40)
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text( index == 0 ? "搜索  ${inputController.text}" : data.searchSugMobileList[index], 
                          style: TextStyle( fontSize: 12, decoration: TextDecoration.none, color: index == 0 ? Colors.blue : Colors.black ),
                        ),
                      )
                    );
                  },
                )
              )
            );
          },
        )
      )
    );
  }
}








