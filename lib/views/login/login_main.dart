import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routers/route.dart';


class LoginMain extends StatefulWidget {
  _LoginMainState createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> with SingleTickerProviderStateMixin {

  double allpadding = ScreenUtil().setWidth(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(1920),
        padding: EdgeInsets.only(
          left: allpadding,
          right: allpadding
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/image/m2.jpg"),
            fit: BoxFit.fitWidth
          )
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: LoginMidBox( ),
            ),
            FootBox()
          ],
        )
      )
    );
  }
}



// 中间盒子

class LoginMidBox extends StatefulWidget {
  final Widget child;

  LoginMidBox({Key key, this.child}) : super(key: key);

  _LoginMidBoxState createState() => _LoginMidBoxState();
}

class _LoginMidBoxState extends State<LoginMidBox> {


  Widget itemButtom( String text, String path ){
    return Container(
        width: ScreenUtil().setWidth(880),
        height: ScreenUtil().setHeight(100),
        margin: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(50)
        ),
        child: FlatButton(
          onPressed: (){
            Routes.router.navigateTo(context, path );
          },
          textColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20),
            side: BorderSide(
              width: 1.0,
              color: Colors.red
            )
          ),
          child: Text("${ text }", style: TextStyle( fontSize: ScreenUtil().setSp( 40 ) ), ),
        )
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(880),
      height: ScreenUtil().setHeight(400),
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(300)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          itemButtom( "手机号登录", "login1" ),
          itemButtom( "注册", "login2" ),
          Text("游客试用", style: TextStyle( fontSize: ScreenUtil().setSp(30) ),)
        ],
      ),
    );
  }
}





// 底部盒子
class FootBox extends StatelessWidget {

  Widget bottombox(){
    Widget itemicon( String iconpath ){
      return IconButton(
        onPressed: (){},
        iconSize: 40,
        icon: Image.asset(
          iconpath,
          width: ScreenUtil().setWidth(180),
          height: ScreenUtil().setHeight(200),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(100)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          itemicon( "asset/image/ape.png" ),
          itemicon( "asset/image/apa.png" ),
          itemicon( "asset/image/apc.png" ),
          itemicon( "asset/image/ap8.png" ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(880),
      height: ScreenUtil().setHeight(400),
      child: Column(
        children: <Widget>[
          Text("其他登录方式"),
          bottombox()
        ],
      ),
    );
  }
}




















