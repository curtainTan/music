import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:music/service/http.dart';
import 'package:music/modal/search.dart';
import 'package:music/modal/search_sug_mobile.dart';
import 'package:music/modal/searchHot.dart';
import 'package:music/modal/search_suggest.dart';
import 'package:music/modal/search-type1.dart';
import 'package:music/modal/mv/search_mv.dart';


class SearchPageProvide with ChangeNotifier{

  String searchInputData = "";
  int tabIndex = 0;
  List<String> searchSugMobileList = [];
  List<String> historyList = [];
  List<String> searchHotList = [];
  Timer atimer = null;
  
  List<SearchType1Songs> type1Song = [];
  List<OnlyMvs> onlyMvList = [];
  

  SearchHot searchHot = null;
  SearchSuggestMul searchComplex = null;

  SharedPreferences pref;
  // 保存历史记录
  saveHistory( String data ){
    if( historyList.length >= 10 ){
      historyList.removeLast();
    }
    int hasData = historyList.indexOf( data );
    if( hasData > 0 ){
      historyList.removeAt(hasData);
      historyList.insert(0, data );
    }else{
      historyList.insert( 0, data );
    }
    pref.setStringList("historySearch", historyList);
  }
  clearData(){
    type1Song = [];
    searchComplex = null;
    notifyListeners();
  }
  // 初始化历史记录
  initHistory() async {
    pref = await SharedPreferences.getInstance();
    historyList = pref.getStringList("historySearch") ?? [];
  }

  // 开始搜索
  searchStart( data ){
    searchInputData = data;
    saveHistory( data );
    // 全部数据置空
    searchComplex = null;
    type1Song = [];
    onlyMvList = [];

    if( tabIndex == 0 ){                  // 综合
      getSearchComplex();
    }
    if( tabIndex == 1 ){                  // 单曲
      requestGet("search", formData: { "keywords" : searchInputData, "limit" : 20, "offset" : 1 }).then( (resData){
        setType1Song(resData);
      });
    }
    if( tabIndex == 2 ){                  // mv
      requestGet("search", formData: { "keywords" : searchInputData, "limit" : 10, "offset" : 1, "type" : 1004 }).then( (resData){
        setType1Song(resData);
      });
    }
    // if( tabIndex == 3 ){                  // 歌手
    //   getSearchComplex( searchType: 100 );
    // }
    notifyListeners();
  }
  // 改变tab的index
  changeTabIndex( index ){
    // print("--------page改变了$index----------");
    tabIndex = index;
    notifyListeners();
  }
  // 综合搜索结果
  getSearchComplex( { page = 0, searchType = 33 } ){
    if( searchType == 33 ){
      requestGet( "searchsuggest", formData: { "keywords" : searchInputData } ).then((onValue){
        searchComplex = SearchSuggestMul.fromJson( onValue );
        // print("--------请求单独的结果>>>>------${searchComplex.result.songs[1].songArtistsss[0].toString()}--");
        notifyListeners();
      });
    } else {
      requestGet( "search", formData: { 
        "keywords" : searchInputData, 
        "offset" : page, 
        "type" : searchType } ).then((onValue){

        print("--------请求成功--------");
        // notifyListeners();

      });
    }
  }
  // type1结果
  setType1Song( data ){

    List<SearchType1Songs> nowSongList = SearchType1.fromJson(data).result.songs;
    type1Song..addAll( nowSongList );
    // print("------------数据长度为----${type1Song.length}----------${nowSongList.length}--");
    notifyListeners();

  }
  // 设置mv
  setMvs( data ){

    SearchMvModal searchMvModal = SearchMvModal.fromJson( data );
    onlyMvList..addAll( searchMvModal.result.mvs );
    notifyListeners();

  }
  // 获取搜索建议     节流
  getSearchSugMobile( data ){
    searchSugMobileList = [];
    searchSugMobileList..add( data );
    if( atimer == null ){
      atimer = Timer( Duration( milliseconds: 1000 ) , (){
        getSuggestRequest( data );
        atimer.cancel();
        atimer = null;
      });
    } else {
      atimer.cancel();
      atimer = null;
      atimer = Timer( Duration( milliseconds: 1000 ) , (){
        getSuggestRequest( data );
        atimer.cancel();
        atimer = null;
      });
    }
  }

  // 获取搜索建议的请求
  getSuggestRequest( data ){
    requestGet(
      "searchsuggest", 
      formData: { "keywords" : data, "type" : "mobile" } ).then((onValue){

      // print("---------------搜索建议-------${onValue.toString()}-----${onValue['result'] == null }--");
      List<String> temp = [];
      SearchSugMobile aaaa = SearchSugMobile.fromJson(onValue);
      if( aaaa.result.allMatch == null ){

      }else{
        aaaa.result.allMatch.forEach(( f ){
          temp..add( f.keyword );
        });
      }
      searchSugMobileList..addAll(temp);
      notifyListeners();
    });
  }

  // 获取热搜
  getSearchHot(){
    searchHotList = [];
    requestGet("searchhot").then((onValue){
      searchHot = SearchHot.fromJson(onValue);
      List<String> temp = [];
      if( searchHot.result.hots != null ){
        searchHot.result.hots.forEach((f){
          temp..add( f.first );
        });
      }
      searchHotList..addAll(temp);
      notifyListeners();
    });
  }







}








