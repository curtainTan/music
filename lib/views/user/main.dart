import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'package:music/service/http.dart';
import './myTabBarView.dart';

import 'package:music/provider/userData.dart';


class UserMain extends StatefulWidget {

  final int uid;
  UserMain({ this.uid });

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> with TickerProviderStateMixin {

  TabController _tabController;
  ScrollController _scrollController;
  bool showTitle = false;
  double op = 1;
  bool showAbout = true;

  @override
  void initState() {
    _tabController = TabController( vsync: this, length: 3 );
    _scrollController = ScrollController();
    _scrollController.addListener(
      (){ 

        // print("----------------->>>>${_scrollController.position.pixels}");
        // print("----------------->>atEdge>>${_scrollController.position.atEdge}");
        // print("-------------->>axis>>${_scrollController.position.axis}");
        // print("---------->>axisDirection>>${_scrollController.position.axisDirection}");
        // print("--------------------->>extentAfter>>${_scrollController.position.extentAfter}");
        // print("--------------------------->>maxScrollExtent>>${_scrollController.position.maxScrollExtent.floor()}");
        // print("----------------->>minScrollExtent>>${_scrollController.position.minScrollExtent}");
        // print("-------------------->>pixels>>${_scrollController.position.pixels}");
        // print("----------------->>runtimeType>>${_scrollController.position.runtimeType}");
        // print("----------------->>physics>>${_scrollController.position.physics}");
        // print("----------------->>pixels>>${_scrollController.position.pixels}");

        setState(() {
         showTitle = _scrollController.position.pixels >= _scrollController.position.maxScrollExtent.floor() ? true : false;
         op = 1.0 - _scrollController.position.pixels.floor() / _scrollController.position.maxScrollExtent.floor();
        });

        if( _scrollController.position.pixels.floor() > (_scrollController.position.maxScrollExtent.floor() / 2) ){
          setState(() {
           showAbout = false;
          });
        }else{
          setState(() {
           showAbout = true;
          });
        }

      }
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _getInfoData( widget.uid );
    _getuserPlayList( widget.uid );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _getInfoData( id ) async {
    await requestGet("userDetail", formData: { "uid": id.toString() }).then((res){
      Provide.value<UserDataProvide>(context).setUserdata(res);
    });
  }
  void _getuserPlayList( id ) async {
    await requestGet("userPlaylist", formData: { "uid": id.toString() }).then((res){
      Provide.value<UserDataProvide>(context).setUserPlayList(res);
    });
  }

  @override
  Widget build(BuildContext context) {

    String head = Provide.value<UserDataProvide>(context).headImg;
    String username = Provide.value<UserDataProvide>(context).name;


    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: ( context, innermy ){
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                forceElevated: innermy,
                elevation: 0,
                pinned: true,
                expandedHeight: ScreenUtil().setHeight(950),

                // action
                actions: <Widget>[
                  IconButton(
                    icon: Icon(IconData( 0xe606, fontFamily: 'iconfont' )),
                    onPressed: (){
                      print("----------------分享》");
                    },
                  )
                ],

                // 底部tabBar
                bottom: PreferredSize(
                  preferredSize: Size( double.infinity , ScreenUtil().setHeight(100)),
                  child: Container(
                    height: ScreenUtil().setHeight(100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical( top: Radius.circular( 10 ) ),
                      color: Colors.white
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicatorWeight: 2.0,
                      labelColor: Colors.red,
                      indicatorColor: Colors.redAccent,
                      unselectedLabelColor: Colors.black,
                      labelStyle: TextStyle( fontWeight: FontWeight.bold ),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: <Widget>[
                          Text("音乐"),
                          Text("动态"),
                          Text("关于我"),
                      ],
                    ),
                  ),
                ),

                titleSpacing: -ScreenUtil().setWidth(50),

                title: showTitle ? Text("${username}", style: TextStyle( 
                   fontSize: ScreenUtil().setSp( 44 )
                ),) : null,

                // about部分
                flexibleSpace: Provide<UserDataProvide>(
                  builder: ( context, child, userdata ){
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: userdata.userdata == null ? 
                            NetworkImage("https://www.curtaintan.club/bg/m2.jpg") : 
                            NetworkImage( userdata.userdata.profile.backgroundUrl ),
                          fit: BoxFit.cover
                        )
                      ),
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(60),
                        right: ScreenUtil().setWidth(60),
                      ),
                      child:  showAbout ?  Opacity(
                        opacity: op,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            headrow( head ),
                            name( username ),
                            aboutme( userdata.userdata ),
                            label( 
                              userdata?.userdata?.level ?? "" , 
                              userdata?.userdata?.profile?.gender ?? 1 , 
                            ),
                          ],
                        ),
                      ) : null
                    );
                  },
                )
              ),
            )
          ];
        },

        body: MySliverTabBarView(_tabController),

      ),
    );
  }


  Widget headrow( head ){
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(150)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: (){
              print("点了一下头像区....");
            },
            child: Container(
              alignment: Alignment.centerLeft,
              child: ClipOval(
                child: Image.network(
                  // "http://curtaintan.club/headImg/1549358122065.jpg",
                  head,
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setHeight(200),
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: (){
              print("点击了一下.........");
            },
            color: Color.fromRGBO(255, 255, 255, 0.5),
            child: Row(
              children: <Widget>[
                Icon(IconData( 0xe658, fontFamily: 'iconfont' ), color: Colors.white, size: ScreenUtil().setSp( 38 ), ),
                Text("编辑", style: TextStyle( color: Colors.white, fontSize: ScreenUtil().setSp( 36 ) ),),
              ],
            )
          ),
        ],
      ),
    );
  }


  Widget name( String username ){
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(40),
        bottom: ScreenUtil().setHeight(10)
      ),
      alignment: Alignment.centerLeft,
      child: Text("${username}", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: ScreenUtil().setSp(40) ),),
    );
  }
 
  Widget aboutme( userData ){
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(20)
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: (){
              print("关注");
            },
            child: userData == null ? Text("关注 0  ", style: TextStyle( color: Colors.white ),) : 
            Text("关注 ${userData.profile.follows}  ", style: TextStyle( color: Colors.white ),)
            // Text("关注 ${ userData == null ? userData.profile.follows : 0 }", style: TextStyle( color: Colors.white ),),
          ),
          InkWell(
            onTap: (){
              print("粉丝");
            },
            child: userData == null ? Text("关注 0  ", style: TextStyle( color: Colors.white ),) : 
            Text("关注 ${ userData.profile.followeds }  ", style: TextStyle( color: Colors.white ),)
            // Text("粉丝 ${userData==null?userData.profile.followeds:0}", style: TextStyle( color: Colors.white )),
          ),
        ],
      ),
    );
  }

  Widget oneLabel( String data ){
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(10),
        left: ScreenUtil().setWidth(20),
        bottom: ScreenUtil().setHeight(10),
        right: ScreenUtil().setWidth(20),
      ),
      margin: EdgeInsets.only(
        right: ScreenUtil().setWidth(20)
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all( Radius.circular(90) ),
        color: Colors.grey
      ),
      child: Text("$data", style: TextStyle( fontSize: ScreenUtil().setSp(30), color: Colors.white ),),
    );
  }

  Widget label( level, gender,  ){
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(40)
      ),
      child: Row(
        children: <Widget>[
          oneLabel( "10后" ),
          oneLabel( "Lv$level" ),
          gender != 1 ? oneLabel( "性别：女" ) : oneLabel( "性别：男" ),
          oneLabel( "广安市" ),
          oneLabel( "射手座" ),
        ],
      ),
    );
  }

}





// 以前的代码



// class UserMain extends StatefulWidget {
//   _UserMainState createState() => _UserMainState();
// }

// class _UserMainState extends State<UserMain> with TickerProviderStateMixin {

//   TabController _tabController;


//   @override
//   void initState() {
//     _tabController = TabController( vsync: this, length: 3, initialIndex: 0 );
//     super.initState();
//   }

//   @override
//   void dispose() {

//     _tabController.dispose();

//     super.dispose();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: NestedScrollView(
//       //   headerSliverBuilder: ( context, inner ){
//       //     return <Widget>[
//       //       CustomScrollView(
//       //         physics: ClampingScrollPhysics(),
//       //         slivers: <Widget>[
//       //           Head( tabController: _tabController, ),
//       //         ]
//       //       )
//       //     ];
//       //   },
//       //   body: BodyBox( child: _tabController, ),
//       // ),
//       body: CustomScrollView(
//         // controller: _scrollController,
//         physics: ClampingScrollPhysics(),
//         slivers: <Widget>[
//           Head( tabController: _tabController, ),
//           SliverToBoxAdapter(
//             child: Container(
//               width: ScreenUtil().setWidth(1080),
//               height: ScreenUtil().setHeight(3520),
//               child: BodyBox( child: _tabController, ),
//             ),
//           ),
//           // SliverOverlapAbsorber(
//           //   child: BodyBox( child: _tabController, ),
//           //   handle: SliverOverlapAbsorberHandle(),
//           // ),
//           // SliverPadding(
//           //   padding: EdgeInsets.all( ScreenUtil().setHeight(20) ),
//           //   sliver: BodyBox( child: _tabController, ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

