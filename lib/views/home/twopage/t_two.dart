import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provide/provide.dart';
import 'package:music/routers/route.dart';
import 'package:music/provider/me.dart';
import 'package:music/provider/userData.dart';

import 'package:music/service/http.dart';
import 'package:music/component/myImage.dart';


class TTwoPage extends StatefulWidget {
  _TTwoPageState createState() => _TTwoPageState();
}

class _TTwoPageState extends State<TTwoPage> with AutomaticKeepAliveClientMixin {

  @override 
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _getfrend( context );
    });
  }

  void _getfrend( context ) async {
    // if( Provide.value<MeInfoProvide>(context).myFollowered == null ){
      var uid = Provide.value<MeInfoProvide>(context).uid;
      await requestGet("userFollows", formData: { "uid": uid }).then(( res ){
        Provide.value<MeInfoProvide>(context).setMyFollowed( res );
      });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(1700),
       child: ListView(
         children: <Widget>[
           Friend(  )
         ],
       ),
    );
  }
}


class Friend extends StatelessWidget {
  Widget _topText(){
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20),
          // bottom: ScreenUtil().setHeight(20)
        ),
        child: Row(
          children: <Widget>[
            Text("我关注的他们", style: TextStyle( fontSize: ScreenUtil().setSp( 40 ) ),),
            Container(
              width: ScreenUtil().setWidth(40),
              alignment: Alignment.centerRight,
              child: Icon( IconData( 0xe65f, fontFamily: 'iconfont' ), size: ScreenUtil().setSp( 34 ), ),
            ),
          ],
        ),
      ),
    );
  }

  Widget item( context, onefollow ){
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: (){
              // print("${onefollow.nickname}");
              Provide.value<UserDataProvide>(context).initUserData( onefollow.nickname, onefollow.avatarUrl);
              Routes.router.navigateTo(context, "/user/" + onefollow.userId.toString() );
            },
            customBorder: CircleBorder(),
            child: MyImage(
              url: onefollow.avatarUrl,
              w: ScreenUtil().setWidth(140),
              h: ScreenUtil().setWidth(140),
              shape: BoxShape.circle,
            ),
          ),
          Text(
            "${onefollow.nickname}", 
            maxLines: 1, 
            overflow: TextOverflow.ellipsis, 
            style: TextStyle( fontSize: ScreenUtil().setSp(34), color: Colors.grey ),)
        ],
      ),
    );
  }

  Widget lists( context ){
    return Provide<MeInfoProvide>(
      builder: ( context, child, meInfoProvide ){
        if( meInfoProvide.myFollowered == null ){
          return Container(
            height: ScreenUtil().setHeight(260),
            child: Center(
              child: Text("加载中..."),
            ),
          );
        }else{
          return Container(
            height: ScreenUtil().setHeight(260),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: meInfoProvide.myFollowered.follow.length,
              itemBuilder: ( context, index ){
                return item( context, meInfoProvide.myFollowered.follow[index] );
              },
            ),
          );
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(40),
        bottom: ScreenUtil().setHeight(40)
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide( width: 0.5, color: Colors.black12 )
        )
      ),
      child: Column(
        children: <Widget>[
          _topText(),
          lists( context )
        ],
      ),
    );
  }
}






