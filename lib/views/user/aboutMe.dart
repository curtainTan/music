import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';






class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView
                    .sliverOverlapAbsorberHandleFor(context),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: ScreenUtil().setHeight( 40 ),
                ),
              ),
              AboutMeBox(title: "个人信息",),
              Introduce()
            ],
          );
        },
      ),
    );
  }
}





class AboutMeBox extends StatelessWidget {
  final String title;

  AboutMeBox({Key key, this.title}) : super(key: key);

  Widget oneItem( String text ){
    return Container(
      child: Text("${ text }", style: TextStyle( fontSize: ScreenUtil().setSp(34), color: Colors.grey ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil().setHeight(360),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(
          left: ScreenUtil().setWidth( 60 )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("${title}", style: TextStyle( fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(38) ), ),
            oneItem("等级：8"),
            oneItem("年龄：10后 射手座"),
            oneItem("性别：男"),
            oneItem("地区：四川省 广安市"),
            oneItem("大学：西华大学"),
          ],
        ),
      )
    );
  }
}



class Introduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil().setHeight(180),
        alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            left: ScreenUtil().setWidth( 60 ),
            top: ScreenUtil().setHeight(40)
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("个人介绍", style: TextStyle( fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(38) ), ),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(20)
              ),
              child: Text("------你嫣然的一笑如含苞待放-----", style: TextStyle( fontSize: ScreenUtil().setSp(34), color: Colors.grey ),),
            )
          ],
        ),
      )
    );
  }
}






