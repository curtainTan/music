import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import './header.dart';
import './listBox.dart';
import 'package:music/service/http.dart';
import 'package:music/provider/inPlayList.dart';
import 'package:provide/provide.dart';
import 'package:music/component/bottomBar.dart';



class SongListPage extends StatefulWidget {
  
  int id;
  SongListPage({ this.id });

  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {

  ScrollController _scrollController;
  bool show = true;      // 控制头部的content展示
  
  @override
  void initState() {
    super.initState();
    
    _scrollController = ScrollController();
    _scrollController.addListener(
      (){
        if( _scrollController.position.pixels.floor() > ScreenUtil().setHeight(800).floor() / 2 ){
          setState(() {
           show = false;
          });
        }
        if( _scrollController.position.pixels.floor() <  ScreenUtil().setHeight(800).floor() / 2 ){
          setState(() {
           show = true;
          });
        }
      }
    );

    yyy( widget.id );

  }

  void yyy( id ) async {

    // print("------歌单重新请求了------");
    await requestGet("playlistdetail", formData: { "id": id }).then( (res){
      Provide.value<InPlayList>(context).setNow( res );
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SongListPageHeader( show: show, ),
          ListBox(  ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: ScreenUtil().setHeight(150),
            ),
          )
        ],
      ),
      bottomSheet: BottomBar(),
    );
  }
}



