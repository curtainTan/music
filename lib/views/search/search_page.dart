import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'package:music/provider/searchPageProvide.dart';

import 'package:music/service/http.dart';
import 'package:music/component/bottomBar.dart';
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
  bool searchSubmit = false;

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
    _tabController.addListener( (){
      if( _tabController.index.toDouble() == _tabController.animation.value ){
        if( _tabController.index == 0 ){
          if( Provide.value<SearchPageProvide>(context).searchComplex == null ){
            Provide.value<SearchPageProvide>(context).getSearchComplex(searchType: 33);
          }
        }
        if( _tabController.index == 1 ){
          if( Provide.value<SearchPageProvide>(context).type1Song.length == 0 ){
            requestGet("search", formData: { "keywords" : searchText, "limit" : 20, "offset" : 1 }).then((onValue){
              Provide.value<SearchPageProvide>(context).setType1Song(onValue);
            });
          }
        }
        if( _tabController.index == 2 ){
          if( Provide.value<SearchPageProvide>(context).onlyVideoList.length == 0 ){
            requestGet("search", formData: { "keywords" : searchText, "limit" : 10, "offset" : 1, "type": 1014 }).then((onValue){
              Provide.value<SearchPageProvide>(context).setMvs(onValue);
            });
          }
        }
        Provide.value<SearchPageProvide>(context).changeTabIndex( _tabController.index );
      }
    } );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provide.value<SearchPageProvide>(context).initHistory();
    Provide.value<SearchPageProvide>(context).getSearchHot();
    super.didChangeDependencies();
  }

  void controlerShow(){
    setState(() {
      showSuggest = false;
    });
  }

  void tapChipMenu( String data ){
    _textEditingController.text = data;
    setState(() {
      searchText = data;
      searchSubmit = true;
      showSuggest = false;
    });
    if( data != Provide.value<SearchPageProvide>(context).searchInputData ){
      Provide.value<SearchPageProvide>(context).searchStart( data );
    }
    
  }

  void inputOnSubmit( String data ){
    if( data != Provide.value<SearchPageProvide>(context).searchInputData ){
      setState(() {
        searchText = data;
        searchSubmit = true;
        showSuggest = false;
      });
      Provide.value<SearchPageProvide>(context).searchStart( data );
    }
  }


  Widget textBox(){
    return Container(
      padding: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(40)
      ),
      child: TextField(
        controller: _textEditingController,
        onSubmitted: inputOnSubmit,
        onChanged: ( data ){
          if( data.length > 0 ){
            Provide.value<SearchPageProvide>(context).getSearchSugMobile( data );
          }
          setState(() {
            searchText = data;
            showSuggest = searchText.length > 0 ;
          });
        },
        style: TextStyle( color: Colors.white, fontSize: ScreenUtil().setSp(40) ),
        decoration: InputDecoration(
          labelText: "",
          labelStyle: TextStyle( fontSize: ScreenUtil().setSp( 70 ) ),
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
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if( searchSubmit ){
          setState(() {
            searchSubmit = false;
          });
        }else{
          Provide.value<SearchPageProvide>(context).clearData();
          Navigator.pop(context, true);
        }
        return false;
      },
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              bottom: searchSubmit ? PreferredSize(
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
                )
              ) : PreferredSize(
                preferredSize: Size( double.infinity , ScreenUtil().setHeight(0) ),
                child: Container(),
              ),
              title: textBox(),
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
            body: searchSubmit ? ResultBox( tabController: _tabController, ) : InitSearchPage( functionInput: tapChipMenu ),
            bottomSheet: BottomBar(),
          ),
          showSuggest ? SearchSuggest( functionShow: controlerShow, functionInput: tapChipMenu ) : Container()
        ],
      ),
    );
  }
}






