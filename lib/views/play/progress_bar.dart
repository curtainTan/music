import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {

  double _value = 0.0;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(90),
      padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth(50) ),
      child: Row(
        children: <Widget>[
          Text( "02:12", style: TextStyle( fontSize: ScreenUtil().setSp( 30 ), color: Colors.white70 ), ),
          Expanded(
            child: Slider(
              value: _value,
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              onChanged: ( val ){
                setState(() {
                 _value = val; 
                });
              },
            ),
          ),
          Text( "04:14", style: TextStyle( fontSize: ScreenUtil().setSp( 30 ), color: Colors.white70 ), ),
        ],
      ),
    );
  }
}










