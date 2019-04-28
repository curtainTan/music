import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../routers/route.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  
  AnimationController _animationController;
  Animation _animation;
  Timer _timer;

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

        _timer =Timer( Duration(seconds: 2) , (){
          // Routes.router.navigateTo(context, '/login', clearStack: true );
          Routes.router.navigateTo(context, '/', clearStack: true );
        });
      }
    });

    _animationController.forward();

  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
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






