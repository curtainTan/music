import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hero"),
      ),
      body: Container(
        child: Center(
          child: Hero(
            tag: "tty",
            child: Container(
              height: ScreenUtil().setHeight(300),
              width: ScreenUtil().setWidth(400),
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}









