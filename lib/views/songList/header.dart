import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

import 'package:music/provider/commentProvider.dart';
import 'package:music/provider/inPlayList.dart';
import 'package:provide/provide.dart';
import 'package:music/routers/route.dart';


class SongListPageHeader extends StatelessWidget {

  bool show;
  
  SongListPageHeader({ this.show });

  @override
  Widget build(BuildContext context) {
    return Provide<InPlayList>(
      builder: ( context, child, data ){
        return SliverAppBar(
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon( IconData( 0xe609, fontFamily: 'iconfont' ) ),
            ),
            IconButton(
              onPressed: (){},
              icon: Icon( IconData( 0xe6bf, fontFamily: 'iconfont' ) ),
            )
          ],
          expandedHeight: ScreenUtil().setHeight(900),
          pinned: true,
          title: show ?
          Text("歌单", style: TextStyle( fontSize: ScreenUtil().setSp( 42 ) ),) :
          Text("${ data.title }", style: TextStyle( fontSize: ScreenUtil().setSp( 42 ) ),),
          titleSpacing: -10,

          // 这里可以插入下面注释的代码。另一种实现的heade

          flexibleSpace: Stack(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(900),
                width: ScreenUtil().setWidth(1080),
                child: prefix0.Image.network(data.headerImg, fit: BoxFit.cover,),
                // decoration: BoxDecoration(
                //   color: Colors.black12.withAlpha(4),
                //   image: DecorationImage(
                //     // image: NetworkImage("https://www.curtaintan.club/bg/m2.jpg"),
                //     image: NetworkImage( data.headerImg ),
                //     fit: BoxFit.cover
                //   )
                // ),
              ),
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur( sigmaX: 15, sigmaY: 15 ),
                  child: Container(
                  // Container(
                    height: ScreenUtil().setHeight(900),
                    width: ScreenUtil().setWidth(1080),
                    color: Colors.grey.withOpacity(0.4),
                    child: show ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        midBox( data, data?.headerImg, data?.nowUiList?.playlist?.playCount ),
                        Container(
                          height: ScreenUtil().setHeight(110),
                          margin: EdgeInsets.only(
                            bottom: ScreenUtil().setHeight(70),
                            top: ScreenUtil().setHeight(60),
                          ),
                          child: Row(
                            children: <Widget>[
                              _oneTab( 
                                icon: 0xe631,
                                text: "评论",
                                count: data.nowUiList?.playlist?.commentCount ?? 0,
                                context: context,
                                title: data.nowUiList?.playlist?.name ?? "-",
                                id: data.nowUiList?.playlist?.id ?? 0,
                                username: data.nowUiList?.playlist?.creator?.nickname ?? "-",
                                cover: data.nowUiList?.playlist?.coverImgUrl ?? "https://www.curtaintan.club/bg/m2.jpg"
                              ),
                              _oneTab( 
                                icon: 0xe606, 
                                text: "分享", 
                                count: data.nowUiList?.playlist?.shareCount ?? 0, 
                                context: context ),
                              _oneTab( 
                                icon: 0xe7ef, 
                                text:"下载", 
                                count: 0, 
                                context: context ),
                              _oneTab( 
                                icon: 0xec37, 
                                text: "多选", 
                                count: 0, 
                                context: context ),
                            ],
                          ),
                        )
                      ],
                    ): null
                  ),
                ),
              ),
            ],
          ),
          bottom: bottomPreferredSize()
        );
      },
    );
  }

  Widget bottomPreferredSize(){
    return PreferredSize(
      preferredSize: Size( double.infinity , ScreenUtil().setHeight(110)),
      child: Container(
        height: ScreenUtil().setHeight(110),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical( top: Radius.circular( 8 ) )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
                right: ScreenUtil().setWidth(30),
              ),
              child: Icon( IconData( 0xe61e, fontFamily: 'iconfont' ), size: ScreenUtil().setSp( 60 ), ),
            ),
            Text("播放全部", style: TextStyle( fontSize: ScreenUtil().setSp( 36 ), fontWeight: FontWeight.w600 ),)
          ],
        ),
      )
    );
  }

  // 底部的一个tab
  Widget _oneTab({ int icon, String text, int count, context, id, cover, title, username }){
    return Container(
      height: ScreenUtil().setHeight(110),
      width: ScreenUtil().setWidth( 270 ),
      child: InkWell(
        onTap: (){
          if( icon == 0xe631 ){
            Provide.value<CommentProvider>(context).initData(
              nowType: 1,
              nowCover: cover,
              nowId: id,
              nowName: username,
              nowTitle: title
            );
            Routes.router.navigateTo(context, Routes.commentPage);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon( IconData( icon, fontFamily: 'iconfont' ), size: ScreenUtil().setSp( 50 ), color: Colors.white ),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setHeight( 4 )
              ),
              child: Text( count == 0 ? text : "$count" , style: TextStyle( fontSize: ScreenUtil().setSp( 32 ), color: Colors.white ), ),
            )
          ],
        ),
      )
    );
  }

  // 中间的盒子
  Widget midBox( inPlayList, imgUrl, count ){
    return Container(
      height: ScreenUtil().setHeight(340),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(340),
                  width: ScreenUtil().setHeight(340),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // image: NetworkImage( "https://www.curtaintan.club/bg/m2.jpg" ),
                      image: NetworkImage( imgUrl ),
                      fit: BoxFit.fitHeight
                    ),
                    borderRadius: BorderRadius.all( Radius.circular(10) )
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  width: ScreenUtil().setWidth(320),
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(10),
                    right: ScreenUtil().setHeight(10)
                  ),
                  child: Text(
                    count == null ? "播放量" : ( count > 10000 ? "播放 ${( count / 10000 ).ceil()}万次" : "播放 $count"  ),
                    style: TextStyle( fontSize: ScreenUtil().setSp(30), color: Colors.white ),
                  ),
                )
              ],
            )
          ),
          Container(
            width: ScreenUtil().setWidth(400),
            height: ScreenUtil().setHeight(340),
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(90)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${inPlayList.title}", 
                  style: TextStyle( fontSize: ScreenUtil().setSp( 48 ), fontWeight: FontWeight.bold, color: Colors.white ),
                  overflow: TextOverflow.ellipsis, maxLines: 2,
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setWidth(100),
                          margin: EdgeInsets.only(
                            right: ScreenUtil().setWidth(20)
                          ),
                          child: CircleAvatar(
                            // backgroundImage: NetworkImage( "http://curtaintan.club/headImg/1549358122065.jpg" ),
                            backgroundImage: inPlayList.nowUiList == null ?
                              NetworkImage( "http://curtaintan.club/headImg/1549358122065.jpg" ):
                              NetworkImage( inPlayList.nowUiList.playlist.creator.avatarUrl )
                          ),
                        ),
                        // Text("至死不渝的回答>", style: TextStyle( fontSize: ScreenUtil().setSp( 36 ), color: Colors.white ))
                        Text( inPlayList.nowUiList == null ? "" : "${inPlayList.nowUiList.playlist.creator.nickname}",
                         style: TextStyle( fontSize: ScreenUtil().setSp( 36 ), color: Colors.white ))
                      ],
                    ),
                  ),
                ),
                Container(
                  child: inPlayList.nowUiList == null ? 
                  Text("编辑信息>", style: TextStyle( fontSize: ScreenUtil().setSp( 32 ), color: Colors.white )) : 
                  Text("${inPlayList.nowUiList.playlist.description} >", 
                    style: TextStyle( fontSize: ScreenUtil().setSp( 32 ), color: Colors.white, ), 
                    overflow: TextOverflow.ellipsis, maxLines: 2, 
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }





}







// flexibleSpace: FlexibleSpaceBarSettings(
//   currentExtent: ScreenUtil().setHeight(960),
//   maxExtent: ScreenUtil().setHeight(960),
//   child: Container(
//     height: ScreenUtil().setHeight(960),
//     decoration: BoxDecoration(
//         image: DecorationImage(
//         image: NetworkImage("https://www.curtaintan.club/bg/m2.jpg"),
//         fit: BoxFit.cover
//       )
//     ),
//     child: show ? Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         midBox(),
//         Container(
//           height: ScreenUtil().setHeight(250),
//           padding: EdgeInsets.only(
//             bottom: ScreenUtil().setHeight(70),
//             top: ScreenUtil().setHeight(60),
//           ),
//           child: Row(
//             children: <Widget>[
//               _oneTab( 0xe631, "评论" ),
//               _oneTab( 0xe606, "分享" ),
//               _oneTab( 0xe7ef, "下载" ),
//               _oneTab( 0xec37, "多选" ),
//             ],
//           ),
//         )
//       ],
//     ): null,
//   ),
// ),



