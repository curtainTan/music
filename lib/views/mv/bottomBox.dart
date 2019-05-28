import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class CommentBottomBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(150),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(

            ),
          ),
          Container(
            
          )
        ],
      ),
    );
  }
}






















