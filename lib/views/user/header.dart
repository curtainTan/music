import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class Head extends StatelessWidget {
  final TabController tabController;

  Head({Key key, this.tabController}) : super(key: key);

  Widget headrow(){
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(180)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Hero(
            tag: "userHead",
            child: InkWell(
              onTap: (){
                print("点了一下头像区....");
              },
              // child: Hero(
              //   tag: "userHead",
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: ClipOval(
                    child: Image.network(
                      "http://curtaintan.club/headImg/1549358122065.jpg",
                      width: ScreenUtil().setWidth(200),
                      height: ScreenUtil().setHeight(200),
                    ),
                  ),
                ),
              // )
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

  Widget aboutme(){
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
            child: Text("关注 12", style: TextStyle( color: Colors.white ),),
          ),
          InkWell(
            onTap: (){
              print("粉丝");
            },
            child: Text("粉丝 12", style: TextStyle( color: Colors.white )),
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



  Widget label(){
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(40)
      ),
      child: Row(
        children: <Widget>[
          oneLabel( "10后" ),
          oneLabel( "Lv8" ),
          oneLabel( "广安市" ),
          oneLabel( "射手座" ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        padding: EdgeInsets.only(),
        icon: Icon(IconData( 0xe62c, fontFamily: 'iconfont' )),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(IconData( 0xe606, fontFamily: 'iconfont' )),
          onPressed: (){
            print("----------------分享》");
          },
        )
      ],
      title: Text("至死不渝的回答"),
      expandedHeight: ScreenUtil().setHeight( 950 ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(
          left: ScreenUtil().setWidth(150),
          bottom: ScreenUtil().setHeight(50)
        ),
        collapseMode: CollapseMode.parallax,
        centerTitle: false,
        background: Container(
          width: ScreenUtil().setWidth(1080),
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(100),
            right: ScreenUtil().setWidth(100),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://www.curtaintan.club/bg/m2.jpg"),
              fit: BoxFit.fitHeight
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              headrow(),
              aboutme(),
              label(),
            ],
          )
        )
      ),
      bottom: PreferredSize(
        preferredSize: Size( ScreenUtil().setWidth(1080) , ScreenUtil().setHeight(100)),
        child: Container(
          height: ScreenUtil().setHeight(100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical( top: Radius.circular( 10 ) ),
            color: Colors.white
          ),
          child: TabBar(
            controller: tabController,
            indicatorWeight: 2.0,
            labelColor: Colors.red,
            indicatorColor: Colors.redAccent,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle( fontWeight: FontWeight.bold ),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
                Text("音乐"),
                Text("动态"),
                Text("关于"),
            ],
          ),
        ),
      ),
    );
  }
}

