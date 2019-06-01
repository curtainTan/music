import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';


import 'package:music/provider/commentProvider.dart';


class CommentTopBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<CommentProvider>(
      builder: ( context, child, data ){
        return InkWell(
          onTap: (){},
          child: Container(
            height: ScreenUtil().setHeight(280),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(30)
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: ScreenUtil().setWidth(1)
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    right: ScreenUtil().setWidth(30)
                  ),
                  height: ScreenUtil().setHeight( 200 ),
                  width: ScreenUtil().setHeight( 200 ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage( data.coverImg ),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular( 6 )
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text( data.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle( fontSize: ScreenUtil().setSp( 42 ) ), ),
                      Text( "by ${data.userName}", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle( fontSize: ScreenUtil().setSp( 32 ) ), )
                    ],
                  ),
                ),
                Icon( IconData( 0xe62d, fontFamily: "iconfont" ), size: ScreenUtil().setSp( 32 ), )
              ],
            ),
          ),
        );
      },
    );
  }
}



