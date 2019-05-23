import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../routers/route.dart';
import 'package:music/provider/play_music.dart';
import 'package:music/provider/me.dart';


class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  
  AnimationController _animationController;
  Animation _animation;
  Timer _timer, _timer2;
  SharedPreferences pref;
  bool isLoged = false;
  int count = 5;

  @override
  void initState() {
    super.initState();

    _animationController =AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _animation =Tween( begin: 0.0, end: 1.0 ).animate(_animationController);
    _timer2 = Timer.periodic( Duration( seconds: 1 ) , ( mytimer ){
      setState(() {
        count -= 1;
      });
    });

    _animation.addStatusListener( ( status ){
      if( status ==AnimationStatus.completed ){
        _timer =Timer( Duration(seconds: 3) , (){
          if( isLoged ){
            Routes.router.navigateTo(context, '/', clearStack: true );
          }else{
            Routes.router.navigateTo(context, '/login', clearStack: true );
          }
        });
      }
    });
    _animationController.forward();

  }

  @override
  void didChangeDependencies() {
    initUserData( context );
    initPlay( context );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    _timer2.cancel();
    super.dispose();
  }

  void initPlay( context ){
    Provide.value<PlayMusic>(context).initplayer();
  }
  
  void initUserData( context ) async {
    pref = await SharedPreferences.getInstance();
    var loged = pref.getInt("userId");
    if( loged != null ){
      setState(() {
       isLoged = true;
      });
    }
    Provide.value<MeInfoProvide>(context).getMeInfo();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =ScreenUtil()..init(context);
    return Stack(
      children: <Widget>[
        FadeTransition(
          opacity: _animation,
          child: Image.asset(
            "asset/image/3.jpg",
            fit: BoxFit.fitHeight,
            height: ScreenUtil().setHeight(1920),
            width: ScreenUtil().setWidth(1080),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight( 150 ),
            right: ScreenUtil().setWidth( 100 )
          ),
          alignment: Alignment.topRight,
          child: Container(
            height: ScreenUtil().setHeight( 90 ),
            width: ScreenUtil().setWidth( 200 ),
            child: RaisedButton(
              color: Colors.grey.withOpacity(0.3),
              padding: EdgeInsets.only(),
              onPressed: (){
                Fluttertoast.showToast(
                  msg: "别想了.不给跳.....",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: ScreenUtil().setSp(40)
                );
              },
              child: Text("跳过 $count", style: TextStyle( fontSize: ScreenUtil().setSp(32), color: Colors.white ),),
            ),
          )
        )
      ],
    );
  }
}






