import 'package:fluro/fluro.dart';


import '../views/home/home.dart';
import '../views/login/login_main.dart';
import '../views/login/login_1.dart';
import '../views/login/login_2.dart';
import '../views/user/main.dart';
import '../views/songList/songList.dart';
import '../views/play/play_page.dart';
import 'package:music/views/search/search_page.dart';
import '../views/mv/mv_main.dart';



class Routes {
  static Router router;
  static String home = '/';
  static String login = '/login';
  static String login1 = '/login1';
  static String login2 = '/login2';
  static String user = '/user/:uid';
  static String songList = '/songList/:id';
  static String playpage = '/playpage';
  static String searchpage = "/searchpage";
  static String mvPage = "/mvs/:id";


  static void configurRoute( Router router ){
    router.define(
      home, handler: Handler( handlerFunc: ( context, params ) => HomePage() ), transitionType: TransitionType.inFromRight
    );
    router.define(
      login, handler: Handler( handlerFunc: ( context, params ) => LoginMain() ), transitionType: TransitionType.inFromRight
    );
    router.define(
      login1, handler: Handler( handlerFunc: ( context, params ) => Login1() ), transitionType: TransitionType.native
    );
    router.define(
      login2, handler: Handler( handlerFunc: ( context, params ) => Login2() ), transitionType: TransitionType.native
    );
    router.define(
      user, handler: Handler( handlerFunc: ( context, params ) => UserMain( uid: int.parse( params['uid'][0] ), ) )
    );
    router.define(
      songList, handler: Handler( handlerFunc: ( context, params ) => SongListPage( id: int.parse( params['id'][0] ), ) )
    );
    router.define(
      playpage, handler: Handler( handlerFunc: ( context, params ) => PlayPage() ), transitionType: TransitionType.inFromBottom
    );
    router.define(
      searchpage, handler: Handler( handlerFunc: ( context, params ) => SearchPage() ), transitionType: TransitionType.inFromRight
    );
    router.define(
      mvPage, handler: Handler( handlerFunc: ( context, params ) => MvPage() ), transitionType: TransitionType.inFromRight
    );


    Routes.router = router;

  }
}






