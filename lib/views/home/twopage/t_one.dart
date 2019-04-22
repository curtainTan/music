import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provide/provide.dart';

import 'package:music/provider/bannerProvider.dart';
import 'package:music/provider/inPlayList.dart';
import 'package:music/routers/route.dart';

import 'package:extended_image/extended_image.dart';

import 'package:music/component/myImage.dart';

class TOne extends StatefulWidget {
  _TOneState createState() => _TOneState();
}

class _TOneState extends State<TOne> with AutomaticKeepAliveClientMixin {

  @override 
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(1700),
       child: ListView(
         children: <Widget>[
           MySwiperBox(  ),
           FourBar(),
           TuiBox(),
           SizedBox(
             height: ScreenUtil().setHeight(200),
           )
         ],
       ),
    );
  }
}





// 轮播图
class MySwiperBox extends StatelessWidget {
  // List lists = [
  //   "asset/image/1.jpg",
  //   "asset/image/3.jpg",
  //   "asset/image/m1.jpg",
  //   "asset/image/yu.jpg"
  // ];

  Widget mySwiper( context ){

    return Provide<BannerProvide>(
      builder: ( context, child, data ){
        if( data.myBanner != null ){
          return Container(
            child: Swiper(
              itemCount: data.myBanner.banners.length,
              autoplay: true,
              pagination: SwiperPagination(),
              itemBuilder: ( BuildContext context, int index ){
                return Container(
                  // padding: EdgeInsets.fromLTRB( pw , ph, pw, 0 ),
                  width: ScreenUtil().setWidth(1080),
                  height: ScreenUtil().setHeight(450),
                  alignment: Alignment.center,
                  // child: ClipRRect(
                    // child: Image.network("${ data.myBanner.banners[index].imageUrl }", fit: BoxFit.fitWidth,),
                    // child: ExtendedImage.network(
                    //   data.myBanner.banners[index].imageUrl,
                    //   fit: BoxFit.fitWidth,
                    // ),
                    child: MyImage(
                      url: data.myBanner.banners[index].imageUrl,
                      b: BoxFit.fitWidth,
                      h: ScreenUtil().setHeight(400),
                      w: ScreenUtil().setWidth(1050),
                      br: 10,
                    ),
                    // borderRadius: BorderRadius.all( Radius.circular( 10 ) ),
                  // )
                );
              },
            ),
          );
        }else{
          return Container(
            child: Text("banner加载中---------")
          );
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      height: ScreenUtil().setHeight(450),
      width: ScreenUtil().setWidth(1080),
      child: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(1080),
            height: ScreenUtil().setHeight(300),
            color: Colors.red,
          ),
          mySwiper( context )
        ],
      ),
    );
  }
}


// 四个圆
class FourBar extends StatelessWidget {

  Widget barItem( int icon, String text ){
    return Container(
      width: ScreenUtil().setWidth( 200 ),
      height: ScreenUtil().setWidth( 220 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth( 150 ),
            height: ScreenUtil().setWidth( 150 ),
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(10)
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              boxShadow: [
                BoxShadow( offset: Offset( 0.0 , 2.0 ), color: Colors.black26, blurRadius: 3, spreadRadius: 1 )
              ]
            ),
            child: IconButton(
              onPressed: (){},
              iconSize: ScreenUtil().setSp(60),
              icon: Icon( IconData( icon, fontFamily: 'iconfont' ), color: Colors.white ),
            )
          ),
          Text( "$text", style: TextStyle( fontSize: ScreenUtil().setSp(30) ), ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(300),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide( width: 0.5, color: Colors.grey )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          barItem(0xe782, "私人FM"),
          barItem(0xe614, "每日推荐"),
          barItem(0xe642, "歌单"),
          barItem(0xe607, "排行榜"),
        ],
      )
    );
  }
}


// 推荐歌单
class TuiBox extends StatelessWidget {

  Widget _toptext(){
    return Container(
        margin: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(20)
        ),
        child: InkWell(
          onTap: (){

          },
        child: Row(
          children: <Widget>[
            Text("推荐歌单", style: TextStyle( fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(40) ),),
            Container(
              width: ScreenUtil().setWidth(40),
              alignment: Alignment.centerRight,
              child: Icon( IconData( 0xe65f, fontFamily: 'iconfont' ), size: ScreenUtil().setSp(36), ),
            )
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Provide<BannerProvide>(
      builder: ( context, child, data ){
        if( data.tuijian == null ){
          return Container(
            child: Text("加载中......"),
          );
        }else{
          return Container(
            width: ScreenUtil().setWidth(1080),
            height: ScreenUtil().setHeight(2100),
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(70),
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15),
            ),
            child: Column(
              children: <Widget>[
                _toptext(),
                Expanded(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: ScreenUtil().setHeight(20),
                      mainAxisSpacing: ScreenUtil().setHeight(40),
                      childAspectRatio: 0.8
                    ),
                    itemBuilder: ( context, index ){
                      return ExtendOneGeDanBox( 
                        image: data.tuijian.result[index].picUrl, 
                        title: data.tuijian.result[index].name, 
                        playCount: (data.tuijian.result[index].playCount / 10000 ).ceil(),
                        listId: data.tuijian.result[index].id,
                      );
                    },
                    itemCount: 12,
                  ),
                )
              ],
            )
          );
        }
      },
    );
  }
}

   

class OneGeDanBox extends StatelessWidget {
  final String image, title;
  final int playCount;
  final int listId;

  OneGeDanBox({Key key, this.image, this.title = "----" , this.playCount = 0, this.listId = 0 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Provide.value<InPlayList>(context).setHeader( image, title, listId);
        Routes.router.navigateTo(context, '/songList/' + listId.toString() ,  );

      },
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(340),
                  height: ScreenUtil().setWidth(340),
                  padding: EdgeInsets.only(
                    right: ScreenUtil().setWidth(10),
                    top: ScreenUtil().setWidth(10),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular( 5 ),
                    image: DecorationImage(
                      image: NetworkImage( image ),
                      fit: BoxFit.fitWidth
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon( IconData( 0xe615, fontFamily: 'iconfont' ), size: ScreenUtil().setSp(35), color: Colors.grey, ),
                      Text( "$playCount" , style: TextStyle( fontSize: ScreenUtil().setSp(35), color: Colors.grey ), )
                    ],
                  )
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth( 10 ) ),
              child: Text("${title}", 
                maxLines: 2, 
                overflow: TextOverflow.ellipsis, 
                style: TextStyle( fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.bold), )
            )
          ],
        ),
      )
    );
  }
}







class ExtendOneGeDanBox extends StatelessWidget {
  final String image, title;
  final int playCount;
  final int listId;

  ExtendOneGeDanBox({Key key, this.image, this.title = "----" , this.playCount = 0, this.listId = 0 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Provide.value<InPlayList>(context).setHeader( image, title, listId);
        Routes.router.navigateTo(context, '/songList/' + listId.toString() ,  );

      },
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                // ExtendedImage.network(
                //   image,
                //   width: ScreenUtil().setWidth(340),
                //   height: ScreenUtil().setWidth(340),
                //   fit: BoxFit.cover,
                //   shape: BoxShape.rectangle,
                //   borderRadius: BorderRadius.circular( 5 ),
                // ),
                MyImage(
                  url: image,
                  w: ScreenUtil().setWidth(340),
                  h: ScreenUtil().setWidth(340),
                  br: 5,
                ),
                Container(
                  padding: EdgeInsets.all( ScreenUtil().setWidth(20) ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon( IconData( 0xe615, fontFamily: 'iconfont' ), size: ScreenUtil().setSp(35), color: Colors.grey, ),
                      Text( "$playCount" , style: TextStyle( fontSize: ScreenUtil().setSp(35), color: Colors.grey ), )
                    ],
                  )
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth( 10 ) ),
              child: Text("${title}", 
                maxLines: 2, 
                overflow: TextOverflow.ellipsis, 
                style: TextStyle( fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.bold), )
            )
          ],
        ),
      )
    );
  }
}




