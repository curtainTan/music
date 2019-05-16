import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provide/provide.dart';
import 'package:music/component/myImage.dart';
import 'package:music/provider/inPlayList.dart';


import 'package:music/provider/play_music.dart';
import 'package:music/provider/searchPageProvide.dart';
import 'package:music/routers/route.dart';
import 'package:music/service/http.dart';


class ResultBox extends StatelessWidget {

  TabController tabController;
  ResultBox({ this.tabController });


  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        Comples(),
        SingleSong(),
        VoidPage(),
        SingerPage(),
        AlbumPage(),
        Gedan(),
        RadioPage(),
        UserPage()
      ],
    );
  }
}





class Comples extends StatefulWidget {
  @override
  _ComplesState createState() => _ComplesState();
}

class _ComplesState extends State<Comples> with AutomaticKeepAliveClientMixin {

  @override 
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    Provide.value<SearchPageProvide>(context).getSearchComplex(searchType: 33);
    print("-----------------这里只渲染一次吗？？------------------------");
    super.didChangeDependencies();
  }

  Widget loading(){
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(300)
        ),
        width: double.infinity,
        height: ScreenUtil().setWidth(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                right: ScreenUtil().setWidth(40)
              ),
              height: ScreenUtil().setWidth(70),
              width: ScreenUtil().setWidth(70),
              child: CircularProgressIndicator(
                strokeWidth: 2,
              )
            ),
            Text("加载中...", style: TextStyle( color: Colors.red ), )
          ], 
        )
      )
    );
  }

  Widget oneItem( int index, context, String songname, String auth, int id ){
    return InkWell(
      onTap: () async {

        requestGet( "checkmusic", formData: { "id" : id } ).then((res1){
          if( res1['success'] != true ){
            print("-------------没有权限----------");
          }else{
            requestGet("songurl", formData: { "id" : id } ).then( ( res ){

              Provide.value<PlayMusic>(context).setPlayUrl( res['data'][0]['url'] );

            } );
            requestGet("lyric", formData: { "id" : id }).then((onValue){
              Provide.value<PlayMusic>(context).initLyricModel(onValue);
            });
          }
        });
      },
      onDoubleTap: (){
        Routes.router.navigateTo(context, Routes.playpage);
      },
      child: Container(
        height: ScreenUtil().setHeight(170),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            aboutBox( songname, auth ),
            sub()
          ],
        ),
      ),
    );
  }

  Widget aboutBox( String songname, String auth ){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text("$songname", style: TextStyle( fontSize: ScreenUtil().setSp( 40 )), ),
          ),
          Text( auth, style: TextStyle( fontSize: ScreenUtil().setSp( 32 ), color: Colors.grey ),)
        ],
      ),
    );
  }

  Widget sub(){
    return Container(
      height: ScreenUtil().setHeight(170),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: (){},
            child: Container(
              height: ScreenUtil().setHeight(170),
              width: ScreenUtil().setWidth(100),
              alignment: Alignment.center,
              child: Icon( IconData( 0xe61e, fontFamily: 'iconfont' ), color: Colors.grey, ),
            )
          ),
          InkWell(
            onTap: (){},
            child: Container(
              height: ScreenUtil().setHeight(170),
              width: ScreenUtil().setWidth(100),
              padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(50)
              ),
              alignment: Alignment.center,
              child: Icon( IconData( 0xe6bf, fontFamily: 'iconfont' ), color: Colors.grey, ),
            )
          )
        ],
      ),
    );
  }

  Widget _singleSongBox( data, context ){
    return Container(
      height: ScreenUtil().setHeight(1200),
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(40)
      ),
      child: Column(
        children: <Widget>[
          headerBox( "单曲" ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: ( context, index ){
                return oneItem( 
                  index, 
                  context, 
                  data[index]?.name ?? "1", 
                  data[index]?.songArtistsss[0]?.name ?? "33",
                  data[index]?.id ?? 123 );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget headerBox( title ){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Text(title, style: TextStyle( fontSize: ScreenUtil().setSp( 46 ), fontWeight: FontWeight.w500 ),),
                Icon( Icons.keyboard_arrow_right )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _gedan( context, List data ){
    return Container(
      height: ScreenUtil().setHeight(700),
      child: Column(
        children: <Widget>[
          headerBox( "歌单" ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: ( context, index ){
                return OneMenu( 
                  imageUrl: data[index]?.cover ?? "https://www.curtaintan.club/bg/m2.jpg",
                  title: data[index]?.name ?? "name" , 
                  id: data[index]?.id ?? 1223 );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Provide<SearchPageProvide>(
        builder: ( context, child, data ){
          return data.searchComplex == null ? loading() : 
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(20)
            ),
            child: Column(
              children: <Widget>[
                _singleSongBox( data.searchComplex.result.songs, context ),
                _gedan( context , data.searchComplex.result.mvs )
              ],
            )
          );
        },
      )
    );
  }
}






class SingleSong extends StatefulWidget {
  @override
  _SingleSongState createState() => _SingleSongState();
}

class _SingleSongState extends State<SingleSong> with AutomaticKeepAliveClientMixin {
  
  @override 
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("SingleSong"),
    );
  }
}


class VoidPage extends StatefulWidget {
  @override
  _VoidPageState createState() => _VoidPageState();
}

class _VoidPageState extends State<VoidPage> with AutomaticKeepAliveClientMixin {
  
  @override 
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("VoidPage"),
    );
  }
}



class SingerPage extends StatefulWidget {
  @override
  _SingerPageState createState() => _SingerPageState();
}

class _SingerPageState extends State<SingerPage> with AutomaticKeepAliveClientMixin {
  
  @override 
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("SingerPage"),
    );
  }
}




class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> with AutomaticKeepAliveClientMixin {
  
  @override 
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("AlbumPage"),
    );
  }
}



class Gedan extends StatefulWidget {
  @override
  _GedanState createState() => _GedanState();
}

class _GedanState extends State<Gedan> with AutomaticKeepAliveClientMixin {
  
  @override 
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Gedan"),
    );
  }
}


class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> with AutomaticKeepAliveClientMixin {
  
  @override 
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("RadioPage"),
    );
  }
}






class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with AutomaticKeepAliveClientMixin {
  
  @override 
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("UserPage"),
    );
  }
}








class OneMenu extends StatelessWidget {

  String imageUrl, title;
  int id;

  OneMenu({Key key, this.imageUrl,this.title, this.id, }) : super(key: key);

  Widget headImg( context, dd ){
    return Container(
      width: ScreenUtil().setHeight(140),
      height: ScreenUtil().setHeight(140),
      margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(20),
        right: ScreenUtil().setWidth(20),
      ),
      child: MyImage(
        h: ScreenUtil().setHeight(140),
        w: ScreenUtil().setHeight(140),
        shape: BoxShape.rectangle,
        url: imageUrl,
        b: BoxFit.cover,
        br: ScreenUtil().setWidth(10),
      ),
    );
  }
  Widget midabout(){
    return Container(
      height: ScreenUtil().setHeight(160),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("${ title }", style: TextStyle( fontSize: ScreenUtil().setSp(38) ), maxLines: 1, overflow: TextOverflow.ellipsis, ),
          Text("126首，已下载66首", style: TextStyle( fontSize: ScreenUtil().setSp(32), color: Colors.grey ), ),
        ],
      ),
    );
  }

  Widget _left(){
    return Container(
      width: ScreenUtil().setWidth( 900 ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide( width: 0.5, color: Colors.black12 )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          midabout(),
          _right()
        ],
      ),
    );
  }

  Widget _right(){
    return InkWell(
      onTap: (){
        print("更多.......");
      },
      child: Container(
        width: ScreenUtil().setWidth( 100 ),
        alignment: Alignment.center,
        child: Icon( IconData( 0xe6bf, fontFamily: 'iconfont' ), size: ScreenUtil().setSp( 60 ), color: Colors.grey ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        Provide.value<InPlayList>(context).setHeader( imageUrl, title, id);
        Routes.router.navigateTo(context, '/songList/' + id.toString() ,  );
        
      },
      child: Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(160),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            headImg( context, 133953518 ),
            _left()
          ],
        ),
      )
    );
  }
}

