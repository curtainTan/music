import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class TopAboutBox extends StatelessWidget {

  bool showMore, isLike;
  String mvTitle, pubTime, description;
  int playcount, publishTimeInt, likeCount, collectCount, commentCount, sharedCount, id;
  final changeFunc;
  List<String> label = [ "MV", "流行", "音乐", "Showtime" ];

  TopAboutBox({ 
    this.showMore, 
    this.changeFunc,
    this.mvTitle,
    this.playcount,
    this.pubTime = "",
    this.publishTimeInt = 0,
    this.id = 0,
    this.collectCount = 0,
    this.commentCount = 0,
    this.isLike = false,
    this.likeCount = 0,
    this.sharedCount = 0,
    this.description = ""
  });

  Widget _iconBottom( int iconData, int count ){
    return InkWell(
      onTap: (){
        
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon( IconData( iconData, fontFamily: "iconfont" ), size: ScreenUtil().setSp(44), color: Colors.grey, ),
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(10)
            ),
            child: Text( "$count", style: TextStyle( color: Colors.grey, fontSize: ScreenUtil().setSp( 30 ) ), ),
          )
        ],
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(40)
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth( 800 ),
                  child: Text( mvTitle ?? "-" , maxLines: 2, overflow: TextOverflow.ellipsis, 
                  style: TextStyle( fontSize: ScreenUtil().setSp(42), fontWeight: FontWeight.bold ),),
                ),
                IconButton(
                  onPressed: changeFunc,
                  icon: Icon( showMore ? Icons.expand_less : Icons.expand_more, size: ScreenUtil().setSp( 60 ), )
                )
              ],
            ),
            Container(
              height: ScreenUtil().setHeight( 80 ),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      right: ScreenUtil().setWidth(20)
                    ),
                    child: Text( playcount > 10000 ? " ${ (playcount / 10000).ceil() }万次观看" : "$playcount 次观看"  ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: ( context, index ){
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth( 38 ),
                            // vertical: ScreenUtil().setHeight( 16 )
                          ),
                          margin: EdgeInsets.only( 
                            right: ScreenUtil().setWidth(18)
                           ),
                          decoration: BoxDecoration(
                            color: Colors.black12.withOpacity( 0.2 ),
                            borderRadius: BorderRadius.circular( 20 )
                          ),
                          child: Text( label[index], style: TextStyle( fontSize: ScreenUtil().setSp( 34 ) ), ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: ScreenUtil().setHeight( 100 ),
              child: Text(
                publishTimeInt == 0 ? "$pubTime 发布" : 
                "${ DateTime.fromMillisecondsSinceEpoch( publishTimeInt ).year }-${ DateTime.fromMillisecondsSinceEpoch( publishTimeInt ).month }-${ DateTime.fromMillisecondsSinceEpoch( publishTimeInt ).day } 发布", 
                style: TextStyle( fontSize: ScreenUtil().setSp( 38 ) ),),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight( 20 )
              ),
              child: Text(
                description, 
                textAlign: TextAlign.left, maxLines: 20, style: TextStyle( fontSize: ScreenUtil().setSp( 34 ) ), 
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              height: ScreenUtil().setHeight( 180 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _iconBottom( 0xeca2, likeCount ),
                  _iconBottom( 0xe618, collectCount ),
                  _iconBottom( 0xe601, commentCount ),
                  _iconBottom( 0xe624, sharedCount ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


















