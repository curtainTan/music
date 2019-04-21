import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provide/provide.dart';
import 'dart:io';
import 'package:flutter/services.dart';

import './routers/route.dart';
import './views/splash.dart';


import './provider/me.dart';
import './provider/play_music.dart';
import './provider/bannerProvider.dart';
import './provider/inPlayList.dart';
import './provider/userData.dart';



void main() {

  var providers = Providers();

  var me = MeInfoProvide();
  var playmusic = PlayMusic();
  var banner = BannerProvide();
  var inplayList = InPlayList();
  var userData = UserDataProvide();

  providers..provide( Provider<MeInfoProvide>.value( me ) )
  ..provide( Provider<PlayMusic>.value( playmusic ) )
  ..provide( Provider<BannerProvide>.value( banner ) )
  ..provide( Provider<InPlayList>.value( inplayList ) )
  ..provide( Provider<UserDataProvide>.value( userData ) )
  ;
  runApp( ProviderNode( child: MyApp(), providers: providers, ) );

  if( Platform.isAndroid ){
    var style = SystemUiOverlayStyle( statusBarColor: Colors.transparent );
    SystemChrome.setSystemUIOverlayStyle(style);
  }

}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final router1 = Router();
    Routes.configurRoute(router1);

    return MaterialApp(
      title: '网易云音乐',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
      ),
      home: SplashScreen(),
      onGenerateRoute: Routes.router.generator,
    );
  }
}



