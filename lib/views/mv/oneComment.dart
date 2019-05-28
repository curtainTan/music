import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class OneComment extends StatelessWidget {

  String headImg, commentContext, userName;
  int userId, commentId, likeCount, time ;
  OneComment({ 
    this.headImg, 
    this.commentContext, 
    this.likeCount,
    this.time,
    this.commentId,
    this.userId,
    this.userName
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("--------点击一整个------");
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth( 40 ),
          top: ScreenUtil().setHeight( 60 ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: (){
                print("点击用户头像------");
              },
              child: Container(
                height: ScreenUtil().setHeight(100),
                width: ScreenUtil().setHeight(100),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage( headImg ?? "http://curtaintan.club/headImg/1549358122065.jpg" ),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenUtil().setWidth(1),
                    color: Colors.grey
                  )
                )
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(10),
                  bottom: ScreenUtil().setHeight(20),
                  right: ScreenUtil().setWidth(40)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: ScreenUtil().setHeight(100),
                      width: ScreenUtil().setWidth( 890 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text( userName ?? "-" , style: TextStyle( fontSize: ScreenUtil().setSp( 32 ) ),),
                                Text("时间", style: TextStyle( fontSize: ScreenUtil().setSp( 26 ) ) )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              print("点赞-------");
                            },
                            child: Container(
                              height: ScreenUtil().setHeight(80),
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(28)
                              ),
                              child: Row(
                                children: <Widget>[
                                  Text( "$likeCount" , style: TextStyle( fontSize: ScreenUtil().setSp( 32 ) ) ),
                                  Icon( IconData( 0xe643, fontFamily: "iconfont" ), size: ScreenUtil().setSp( 30 ), )
                                ],
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        bottom: ScreenUtil().setHeight(20)
                      ),
                      width: ScreenUtil().setWidth( 800 ),
                      child: Text( 
                        commentContext ?? "---" ,
                        textDirection: TextDirection.ltr,
                        softWrap: true,
                        maxLines: 20, 
                        style: TextStyle( fontSize: ScreenUtil().setSp( 34 ), color: Colors.black87 ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }
}





















