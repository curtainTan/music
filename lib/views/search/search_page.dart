import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import './search_suggest.dart';
import './init_page.dart';
import './result_box.dart';



class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {

  String searchText = "";
  TextEditingController _textEditingController;
  TabController _tabController;
  bool showSuggest = false;

  List<Widget> tabBarList = [
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20)
      ),
      child: Text("综合", style: TextStyle( fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold ),),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20)
      ),
      child: Text("单曲", style: TextStyle( fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold )),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20)
      ),
      child: Text("视频", style: TextStyle( fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold )),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20)
      ),
      child: Text("歌手", style: TextStyle( fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold )),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20)
      ),
      child: Text("专辑", style: TextStyle( fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold )),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20)
      ),
      child: Text("歌单", style: TextStyle( fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold )),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20)
      ),
      child: Text("主播电台", style: TextStyle( fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold )),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20)
      ),
      child: Text("用户", style: TextStyle( fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold )),
    )
  ];




  @override
  void initState() {
    _textEditingController = TextEditingController();
    _tabController = TabController( length: 8, vsync: this );
    super.initState();
  }

  void controlerShow(){
    setState(() {
      showSuggest = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            // bottom: PreferredSize(
            //   preferredSize: Size( double.infinity , ScreenUtil().setHeight(0) ),
            //   child: Container(),
            // ),
            bottom: PreferredSize(
              preferredSize: Size( double.infinity , ScreenUtil().setHeight(100) ),
              child: Container(
                height: ScreenUtil().setHeight(100),
                // alignment: Alignment.center,
                child: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: tabBarList,
                )
              ),
            ),
            title: Container(
              padding: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(40)
              ),
              child: TextField(
                controller: _textEditingController,
                onChanged: ( data ){
                  setState(() {
                    searchText = data;
                    showSuggest = searchText.length > 0 ;
                  });
                },
                style: TextStyle( color: Colors.white, fontSize: ScreenUtil().setSp(50) ),
                decoration: InputDecoration(
                  labelText: "",
                  labelStyle: TextStyle( fontSize: ScreenUtil().setSp( 46 ) ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(20)
                  ),
                  isDense: true,
                  suffixIcon: IconButton(
                    alignment: Alignment.bottomCenter,
                    highlightColor: searchText.length > 0 ? Colors.white : Colors.transparent,
                    splashColor: searchText.length > 0 ? Colors.white : Colors.transparent,
                    icon: Icon( Icons.close, color: searchText.length > 0 ? Colors.white : Colors.red, size: ScreenUtil().setSp( 50 ), ),
                    onPressed: (){
                      setState(() {
                        _textEditingController.text = "";
                      });
                    },
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.white
                    )
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.white
                    )
                  ),
                ),
              )
            ),
            actions: <Widget>[
              IconButton(
                onPressed: (){

                },
                padding: EdgeInsets.only(
                  right: ScreenUtil().setWidth(40)
                ),
                icon: Icon( Icons.person ),
              )
            ],
          ),
          body: ResultBox( tabController: _tabController, ),
          // body: SingleChildScrollView(
          //   child: InitSearchPage(),
          // ),
        ),
        showSuggest ? SearchSuggest( functionShow: controlerShow, ) : Container()
      ],
    );
  }
}






