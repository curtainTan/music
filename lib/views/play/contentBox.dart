import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'dart:async';


import 'package:music/provider/play_music.dart';
import 'package:music/component/myImage.dart';


// import 'package:music/event_bus/play.dart';

class ContentBox extends StatefulWidget {
  @override
  _ContentBoxState createState() => _ContentBoxState();
}

class _ContentBoxState extends State<ContentBox> with SingleTickerProviderStateMixin {

  int selectIndex = 0;
  AnimationController _controller;
  Animation _animation;
  ScrollController scrollController;
  int lyIndex = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController( initialScrollOffset: 0.0, keepScrollOffset: false );
    _controller = AnimationController( vsync: this, duration: Duration( seconds: 28 ) );
    _animation = Tween( begin: 0.0, end: 1.0 ).animate( CurvedAnimation( parent: _controller, curve: Curves.linear ) );
    _controller.addStatusListener(
      ( AnimationStatus status ){
        if( status == AnimationStatus.completed ){
          _controller.reset();
          _controller.forward();
        }
      }
    );

    timer = Timer.periodic( Duration( milliseconds: 500 ), ( item ){
      int nowLyricIndex = Provide.value<PlayMusic>(context).nowLyricIndex;
      if( lyIndex != nowLyricIndex ){
        scrollController.animateTo( (nowLyricIndex-3) * ScreenUtil().setHeight(150), duration: Duration( milliseconds: 200 ), curve: Curves.linear );
        setState(() {
          lyIndex = nowLyricIndex;
        });
      }
    } );
  }

  @override
  void dispose() {
    _controller.dispose();
    timer.cancel();
    scrollController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {

    return Provide<PlayMusic>(
      builder: ( context, child, data ){
        data.isPlay ? _controller.forward() : _controller.stop();
        return Container(
          height: ScreenUtil().setHeight(1300),
          width: ScreenUtil().setWidth(1080),
          child: IndexedStack(
            index: selectIndex,
            children: <Widget>[
              _one( data.tracks.al.picUrl ),
              _two( context, data.lyricList, data.nowLyricIndex, scrollController )
            ],
          ),
        );
      },
    );
  }

  Widget _one( url ){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                setState(() {
                  selectIndex = selectIndex == 0 ? 1 : 0;
                });
              },
              child: RotationTransition(
                turns: _animation,
                child: Center(
                  child: MyImage(
                    shape: BoxShape.circle,
                    url: url,
                    h: ScreenUtil().setWidth(650),
                    w: ScreenUtil().setWidth(650),
                  ),
                  // child: Container(
                  //   height: ScreenUtil().setWidth(650),
                  //   width: ScreenUtil().setWidth(650),
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       // image: NetworkImage("https://www.curtaintan.club/bg/m2.jpg"),
                  //       image: NetworkImage(url),
                  //       fit: BoxFit.cover
                  //     ),
                  //     shape: BoxShape.circle
                  //   ),
                  // ),
                )
              )
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                oneIcon( 0xe7df ),
                oneIcon( 0xe7ef ),
                oneIcon( 0xe64d ),
                oneIcon( 0xe631 ),
                oneIcon( 0xe6bf ),
              ],
            ),
          )
        ],
      )
    );
  }

  Widget oneIcon( int icon ){
    return IconButton(
      onPressed: (){

      },
      icon: Icon( IconData( icon, fontFamily: 'iconfont' ), color: Colors.white, size: ScreenUtil().setSp(65), ),
    );
  }

  Widget _two( context, List lyricList, int nowLyricIndex, scrollController ){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectIndex = selectIndex == 0 ? 1 : 0; 
        });
      },
      child: Center(
        child: Container(
          height: ScreenUtil().setHeight(1050),
          width: ScreenUtil().setWidth(750),
          child: ListView.builder(
            itemExtent: ScreenUtil().setHeight(150),
            controller: scrollController,
            itemBuilder: ( context, index ){
              return ListTile(
                title: Center(
                  child: Text(
                    "${lyricList[index]}", 
                    style: TextStyle( color: (nowLyricIndex -1 ) != index ? Colors.white30 : Colors.white ),
                    textAlign: TextAlign.center,
                  ),
                )
              );
            },
            itemCount: lyricList.length,
          ),
        ),
      ),
    );
  }


}






