import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Login2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text("注册"),
        titleSpacing: ScreenUtil().setWidth( -30 ),
      ),
      body: Builder(
        builder: ( context ){
          return Center(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight( 200 ),
                  child: Text("抱歉~暂时未做注册.....", style: TextStyle( fontSize: ScreenUtil().setSp( 42 ), fontWeight: FontWeight.bold ),),
                ),
                Container(
                  height: ScreenUtil().setHeight( 100 ),
                  alignment: Alignment.center,
                  child: Text("你可以使用下面的账号密码:"),
                ),
                InkWell(
                  onLongPress: (){
                    Clipboard.setData( ClipboardData( text: "13882628313" ) );
                    final snackBar = SnackBar(
                      content: Text("账号已复制到粘贴板."),
                    );
                    Scaffold.of(context).showSnackBar( snackBar );
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(220),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("账号：13882628313", style: TextStyle( fontSize: ScreenUtil().setSp( 42 ) ),),
                        Text("---长按复制")
                      ],
                    ),
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(100),
                  child: Text("密码：wangyiyun1008611"),
                )
              ],
            ),
          );
        },
      )
    );
  }
}



