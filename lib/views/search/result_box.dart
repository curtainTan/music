import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provide/provide.dart';



import 'package:music/provider/searchPageProvide.dart';



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

  @override
  Widget build(BuildContext context) {
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
      // child: Center(
      //   child: SpinKitRotatingPlain(
      //     color: Colors.red,
      //     size: 30,
      //   ),
      // ),
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







