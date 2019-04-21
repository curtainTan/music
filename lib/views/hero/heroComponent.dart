import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class HeroComponent extends StatelessWidget {

  final String url;
  final double w;

  HeroComponent( { this.url, this.w } );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        key: Key("7778888999"),
        tag: "8888gggg",
        child: Container(
          width: w,
          height: w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all( Radius.circular( ScreenUtil().setWidth(10) ) ),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              // image: NetworkImage("http://curtaintan.club/headImg/1549358122065.jpg"),
              image: NetworkImage( url ),
            )
          ),
        ),
      ),
    );
  }
}















