import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class TopAboutBox extends StatelessWidget {

  bool showMore;
  final changeFunc;
  List<String> label = [ "MV", "流行", "音乐", "Showtime" ];

  TopAboutBox({ this.showMore, this.changeFunc });
  

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(40)
        ),
        height: ScreenUtil().setHeight(300),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("这里是标题------", maxLines: 2, overflow: TextOverflow.ellipsis, 
                style: TextStyle( fontSize: ScreenUtil().setSp(42), fontWeight: FontWeight.bold ),),
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
                    child: Text("80万次观看"),
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
              child: Text("2017-1-11 发布", style: TextStyle( fontSize: ScreenUtil().setSp( 38 ) ),),
            )
          ],
        ),
      ),
    );
  }
}


















