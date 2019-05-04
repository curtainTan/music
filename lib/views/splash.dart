import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../routers/route.dart';
import 'package:music/provider/play_music.dart';
import 'package:music/provider/me.dart';


class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  
  AnimationController _animationController;
  Animation _animation;
  Timer _timer;
  SharedPreferences pref;
  bool isLoged = false;

  @override
  void initState() {
    super.initState();

    _animationController =AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _animation =Tween( begin: 0.0, end: 1.0 ).animate(_animationController);

    _animation.addStatusListener( ( status ){
      if( status ==AnimationStatus.completed ){

        _timer =Timer( Duration(seconds: 3) , (){
          if( isLoged ){
            print("-----------uid---------");
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
    return FadeTransition(
      opacity: _animation,
      child: Image.asset(
        "asset/image/3.jpg",
        fit: BoxFit.fitHeight,
      ),
    );
  }
}






