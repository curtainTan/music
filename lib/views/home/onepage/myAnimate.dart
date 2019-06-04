import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:music/provider/me.dart';
import 'package:provide/provide.dart';


import 'package:music/commonFunc/bottomModal.dart';
import './one_menu.dart';


class MyAnimateZhuan extends StatefulWidget {
  String text;
  bool isMe;

  MyAnimateZhuan({Key key, this.text, this.isMe }) : super(key: key);

  _MyAnimateZhuanState createState() => _MyAnimateZhuanState();
}

class _MyAnimateZhuanState extends State<MyAnimateZhuan> with SingleTickerProviderStateMixin {

  AnimationController _rotation;
  Animation _animation;
  bool o1 = true;

  @override
  void initState() {
    super.initState();
    _rotation =AnimationController( vsync: this, duration: Duration( milliseconds: 1000 ) );
    _animation = Tween( begin: 0.0, end: 0.25 ).animate( CurvedAnimation(
      parent: _rotation,
      curve: Curves.bounceOut
    ) );
  }
  @override
  void dispose() {
    _rotation.dispose();
    super.dispose();
  }

  void zhuan(  ){
    if( o1 ){
      this.setState((){
        _animation = Tween( begin: 0.0, end: 0.25 ).animate( CurvedAnimation(
          parent: _rotation,
          curve: Curves.bounceOut
        ) );
        o1 = !o1;
      });
    }else{
      this.setState((){
        _animation = Tween( begin: 0.25, end: 0.0 ).animate( CurvedAnimation(
          parent: _rotation,
          curve: Curves.bounceOut
        ) );
        o1 = !o1;
      });
    }
    _rotation.reset();
    _rotation.forward();
  }

  Widget gedan( context ){

    if( !o1 ){
      return Provide<MeInfoProvide>(
        builder: ( context, child, data ){
          if( data.myPlayList == null ){
            return Container(
              child: Text("正在加载中......."),
            );
          }else{
            if( widget.isMe ){
              return Container(
                height: ScreenUtil().setHeight( data.onlyMyPlayList.length * 160.0),
                width: ScreenUtil().setWidth(1080),
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: data.onlyMyPlayList.length,
                  itemBuilder: ( context, index ){
                    return OneMenu(
                      imageUrl: data.onlyMyPlayList[index].coverImgUrl, 
                      title: data.onlyMyPlayList[index].name,
                      id: data.onlyMyPlayList[index].id,
                      isMe: widget.isMe,
                      index: index,
                    );
                  },
                ),
              );
            }else{
              return Container(
                height: ScreenUtil().setHeight( data.collectionPlayList.length * 160.0 ),
                width: ScreenUtil().setWidth(1080),
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: data.collectionPlayList.length,
                  itemBuilder: ( context, index ){
                    return OneMenu(
                      imageUrl: data.collectionPlayList[index].coverImgUrl, 
                      title: data.collectionPlayList[index].name,
                      id: data.collectionPlayList[index].id,
                      isMe: widget.isMe,
                      index: index,
                    );
                  },
                ),
              );
            }
          }
        },
      );
    }else{
      return Container();
    }

  }

  Widget _head( context ){
    List<int> icon =[ 0xe60d, 0xe655, 0xe67f, 0xe605 ];
    List<String> text = [ "创建新歌单", "我的歌单", "截图导入歌单", "回复歌单" ];
    return Container(
      color: Colors.black12,
      height: ScreenUtil().setHeight(80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: (){
              zhuan();
            },
            child: Container(
              width: ScreenUtil().setWidth(900),
              height: ScreenUtil().setHeight(80),
              child: Row(
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(80),
                    alignment: Alignment.center,
                    child: RotationTransition(
                      turns: _animation,
                      child: Icon( IconData( 0xe65f, fontFamily: 'iconfont' ), size: ScreenUtil().setSp(30), ),
                    ),
                  ),
                  Text( "${widget.text}", style: TextStyle( fontSize: ScreenUtil().setSp(30),), )
                ],
              )
            )
          ),
          IconButton(
            onPressed: (){
              myShowModal( context, icon, text ).then((onValue){
                print("---返回的值------$onValue");
              });
            },
            iconSize: ScreenUtil().setSp(30),
            icon: Icon( IconData( 0xe64b, fontFamily: 'iconfont' ) ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _head( context ),
          gedan( context )
        ],
      )
      
    );
  }
}
