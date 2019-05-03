import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './myAnimate.dart';

class OneMidBox extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MyAnimateZhuan( text: "创建的歌单", isMe: true, ),
          MyAnimateZhuan( text: "收藏的歌单", isMe: false, ),
          SizedBox(
            height: ScreenUtil().setHeight(150),
          )
        ],
      )
    );
  }
}


