import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provide/provide.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:music/routers/route.dart';
import 'package:music/provider/me.dart';

import 'package:music/modal/user_model.dart';
import 'package:music/service/http.dart';


class Login1 extends StatefulWidget {
  final Widget child;

  Login1({Key key, this.child}) : super(key: key);

  _Login1State createState() => _Login1State();
}

class _Login1State extends State<Login1> with SingleTickerProviderStateMixin {

  TextEditingController phone, psw;
  Animation _animation, _animationphone, _animationpsw;
  AnimationController _animationController;
  Timer _timer;

  @override
  void initState() {
    phone = TextEditingController();
    psw = TextEditingController();
    _animationController = AnimationController( vsync: this, duration: Duration( milliseconds: 1500 ));
    _animation =Tween( begin: -1.0, end: 0.0 ).animate(
      CurvedAnimation( parent: _animationController, curve: Curves.fastOutSlowIn )
    );
    _animationphone =Tween( begin: -1.0, end: 0.0 ).animate( 
      CurvedAnimation( parent: _animationController, curve: Interval(0.2, 1.0, curve: Curves.fastOutSlowIn) )
     );
     _animationpsw =Tween( begin: -1.0, end: 0.0 ).animate( 
      CurvedAnimation( parent: _animationController, curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn) )
     );

     _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void subme(){
    if( phone.text.length != 11 ){
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: ( context ){
          return AlertDialog(
            title: Text("提示！"),
            content: Text("算我求你，电话号码是11位的，好吧...."),
            titlePadding: EdgeInsets.all( 20 ),
          );
        }
      );
      return;
    }
    if( psw.text.length < 6 ){
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: ( context ){
          return AlertDialog(
            title: Text("提示！"),
            content: Text("密码密码密码太短了...."),
            titlePadding: EdgeInsets.all( 20 ),
          );
        }
      );
      return;
    }

    // Routes.router.navigateTo(context, '/', clearStack: true);
    // return;

    var formData = {
      "phone" : phone.text,
      "password" : psw.text
    };
    requestSetCookie("login", formData: formData ).then( (res){
      print("-------登录成功...------${res.toString()}-----");
      if( res['success'] == null ){
        UserModel useAlittle = UserModel.fromJson(res);
        Fluttertoast.showToast(
          msg: "登录成功......",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: ScreenUtil().setSp(40)
        );
        
        DateTime nowTime = DateTime.now();
        Provide.value<MeInfoProvide>(context).saveNameAndPsw( phone.toString(), psw.toString(), nowTime.toString(), useAlittle.profile.userId );

        requestGet( "userDetail", formData: { "uid" : useAlittle.profile.userId } ).then( ( meInfoData ){
          Provide.value<MeInfoProvide>(context).setMeinfo(meInfoData);
          print("------------设置成功-----zhunbei jishi ");
          _timer = Timer( Duration( seconds: 1 ) , (){
            Routes.router.navigateTo(context, '/', clearStack: true);
          });
        });

      }else{
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: ( context ){
            return AlertDialog(
              title: Text("提示！"),
              content: Text("账号或密码错误...."),
              titlePadding: EdgeInsets.all( 20 ),
            );
          }
        );
        return;
      }
    });
    
  }


  Widget btn(){
    return Container(
      width: ScreenUtil().setWidth(980),
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(50)
      ),
      child: FlatButton(
        onPressed: subme,
        shape: StadiumBorder(),
        color: Colors.red,
        child: Text("登录", style: TextStyle( color: Colors.white, fontSize: ScreenUtil().setSp(40) ),),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    final double w = ScreenUtil().setWidth(1080);

    return AnimatedBuilder(
        animation: _animationController,
        builder: ( BuildContext context, Widget child ){
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              title: Text("手机登录"),
              leading: IconButton(
                icon: Icon(IconData( 0xe62c, fontFamily: 'iconfont' )),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ),
            body: SingleChildScrollView(
              child: Transform(
                transform: Matrix4.translationValues(
                  _animation.value * w, 0.0, 0.0
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(50)
                  ),
                  width: ScreenUtil().setWidth(1080),
                  child: Column(
                    children: <Widget>[
                      Transform(
                        transform: Matrix4.translationValues( _animationphone.value * w , 0.0, 0.0),
                        child: new ItemInput( textcontroller: phone, text: "请输入手机号", icon: 0xe619, fretext: "+86", regexpIndex: 0 ),
                      ),
                      Transform(
                        transform: Matrix4.translationValues( _animationphone.value * w , 0.0, 0.0),
                        child: new ItemInput( textcontroller: psw, text: "请输入密码", icon: 0xe633, ob: true,  regexpIndex: 1 ,inputtype: 1,),
                      ),
                      Transform(
                        transform: Matrix4.translationValues( _animationpsw.value * w , 0.0, 0.0),
                        child: btn(),
                      ),
                    ],
                  ),
                ),
              )
            )
          );
        },
      );
  }
}



class ItemInput extends StatelessWidget {
  final TextEditingController textcontroller;
  final String text;
  final int icon;
  final String fretext;
  final bool ob;
  final int regexpIndex;
  final int inputtype;
  List regexp = [
    [
      BlacklistingTextInputFormatter( RegExp("[a-z]") ),
      WhitelistingTextInputFormatter( RegExp("[0-9]") ),
      LengthLimitingTextInputFormatter( 11 ),
    ],
    [
      LengthLimitingTextInputFormatter( 20 ),
      WhitelistingTextInputFormatter( RegExp("[0-9a-zA-Z]") ),
    ]
  ];

  ItemInput({
    Key key,
    this.textcontroller,
    this.text,
    this.icon,
    this.fretext = "",
    this.ob = false,
    this.inputtype = 0,
    this.regexpIndex = 1 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(980),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black12
          )
        )
      ),
      child: TextField(
        style: TextStyle( fontSize: ScreenUtil().setSp( 40 ), color: Colors.grey ),
        controller: textcontroller,
        keyboardType: inputtype == 0?TextInputType.numberWithOptions(decimal: true):TextInputType.text,
        obscureText: ob,
        inputFormatters: regexp[regexpIndex],
        decoration: InputDecoration(
          icon: Icon( IconData( icon, fontFamily: 'iconfont' ), color: Colors.grey, ),
          labelText: text,
          prefixText: "$fretext",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric( vertical: ScreenUtil().setHeight(20) )
        ),
      ),
    );
  }
}





