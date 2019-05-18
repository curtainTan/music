import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:music/service/http.dart';
import 'package:provide/provide.dart';
import 'package:music/component/myImage.dart';
import 'package:music/provider/inPlayList.dart';


import 'package:music/provider/play_music.dart';
import 'package:music/provider/searchPageProvide.dart';
import 'package:music/routers/route.dart';


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
            // 获取歌曲信息，并复制到tracks上面
            requestGet("songdetail", formData: { "ids" : id } ).then((onValue){
              Provide.value<PlayMusic>(context).onlySetTrack( onValue );
            });
            // 获取歌曲url
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
      height: ScreenUtil().setHeight(800),
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(40)
      ),
      child: Column(
        children: <Widget>[
          headerBox( "单曲" ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemExtent: ScreenUtil().setHeight(170),
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
                Text(title, style: TextStyle( fontSize: ScreenUtil().setSp( 42 ), fontWeight: FontWeight.w500 ),),
                Icon( Icons.keyboard_arrow_right, size: ScreenUtil().setSp( 45 ), )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _gedan( context, List data ){
    return Container(
      height: ScreenUtil().setHeight( 100.0 + (data.length * 260) ),
      child: Column(
        children: <Widget>[
          headerBox( "歌单" ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: ( context, index ){
                return OneMenu( 
                  imageUrl: data[index]?.coverImgUrl ?? "https://www.curtaintan.club/bg/m2.jpg",
                  title: data[index]?.name ?? "name" , 
                  playCount: data[index]?.playCount ?? 44,
                  trackCount: data[index]?.trackCount ?? 56,
                  id: data[index]?.id ?? 1223 );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _artists( context, List data ){
    return data.length == 0 ? Container() : Container(
      height: ScreenUtil().setHeight( 100.0 + (data.length * 200) ),
      child: Column(
        children: <Widget>[
          headerBox( "歌手" ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemExtent: ScreenUtil().setHeight(200),
              itemBuilder: ( context, index ){
                return _asinger( data[index].picUrl, data[index].name );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _asinger( img, name ){
    return InkWell(
      onTap: (){

      },
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage( img ),
                  fit: BoxFit.cover
                ),
                shape: BoxShape.circle
              ),
            ),
            Container(
              child: Text( name ),
            )
          ],
        ),
      )
    );
  } 


  Widget _mvs( context, List data ){
    return data.length == 0 ? Container() : Container(
      height: ScreenUtil().setHeight( 100.0 + (data.length * 260) ),
      child: Column(
        children: <Widget>[
          headerBox( "视频" ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemExtent: ScreenUtil().setHeight(200),
              itemBuilder: ( context, index ){
                return OneMenu( 
                  imageUrl: data[index]?.cover ?? "https://www.curtaintan.club/bg/m2.jpg",
                  title: data[index]?.name ?? "name" , 
                  playCount: data[index]?.playCount ?? 44,
                  trackCount: data[index]?.trackCount ?? 56,
                  id: data[index]?.id ?? 1223 );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _albums( context, List data ){
    return data.length == 0 ?
      Container() : Container(
        height: ScreenUtil().setHeight( 100.0 + (data.length * 260) ),
        child: Column(
          children: <Widget>[
            headerBox( "专辑" ),
            Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: ( context, index ){
                  return OneMenu( 
                    imageUrl: data[index]?.songArtist?.picUrl ?? "https://www.curtaintan.club/bg/m2.jpg",
                    title: data[index]?.name ?? "name" ,
                    playCount: data[index]?.size ?? 1,
                    trackCount: data[index]?.size ?? 56,
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
            child: data.searchComplex.result != null ? Column(
              children: <Widget>[
                _singleSongBox( data.searchComplex.result.songs, context ),
                _gedan( context , data.searchComplex.result.playlists ),
                _albums(context, data.searchComplex.result.albums),
                _artists(context, data.searchComplex.result.artists)
              ],
            ) : Center(
              child: Text("没有找到相关数据......"),
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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
  int id, playCount, trackCount;

  OneMenu({Key key, this.imageUrl,this.title, this.id, this.playCount, this.trackCount }) : super(key: key);

  Widget headImg( context, dd ){
    return Container(
      width: ScreenUtil().setHeight(230),
      height: ScreenUtil().setHeight(230),
      margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(20),
        right: ScreenUtil().setWidth(20),
      ),
      child: MyImage(
        h: ScreenUtil().setHeight(230),
        w: ScreenUtil().setHeight(230),
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
          Text("${ title }", style: TextStyle( fontSize: ScreenUtil().setSp(38) ), maxLines: 2, overflow: TextOverflow.ellipsis, ),
          Text("${ trackCount }首，播放${ (playCount / 10000).ceil() }万次", style: TextStyle( fontSize: ScreenUtil().setSp(32), color: Colors.grey ), ),
        ],
      ),
    );
  }

  Widget _left(){
    return Container(
      child: midabout(),
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
        height: ScreenUtil().setHeight(260),
        child: Row(
          children: <Widget>[
            headImg( context, 133953518 ),
            _left()
          ],
        ),
      )
    );
  }
}

