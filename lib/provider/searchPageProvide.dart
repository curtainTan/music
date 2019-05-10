import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:music/service/http.dart';
import 'package:music/modal/search.dart';
import 'package:music/modal/search_sug_mobile.dart';
import 'package:music/modal/searchHot.dart';
import 'package:music/modal/search_suggest.dart';


class SearchPageProvide with ChangeNotifier{

  String searchInputData = "";
  int tabIndex = 0;
  List<String> searchSugMobileList = [];
  List<String> historyList = [];
  List<String> searchHotList = [];
  Timer atimer = null;

  SearchHot searchHot = null;
  SearchSuggestMul searchComplex = null;


  // 开始搜索
  searchStart( data ){
    searchInputData = data;
    // searchComplex = null;
    // if( tabIndex == 0 ){                  // 综合
    //   getSearchComplex();
    // }
    // if( tabIndex == 1 ){                  // 单曲
    //   getSearchComplex( searchType: 1 );
    // }
    // if( tabIndex == 3 ){                  // 歌手
    //   getSearchComplex( searchType: 100 );
    // }
    notifyListeners();
  }
  // 改变tab的index
  changeTabIndex( index ){
    print("--------page改变了$index----------");
    tabIndex = index;
    notifyListeners();
  }
  // 综合搜索结果
  getSearchComplex( { page = 0, searchType = 33 } ){
    if( searchType == 33 ){
      print("--------请求成>>>>------${searchInputData}--");
      requestGet( "searchsuggest", formData: { "keywords" : searchInputData } ).then((onValue){
        // print("--------请求成功------${onValue.toString()}--");
        searchComplex = SearchSuggestMul.fromJson( onValue );
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
  // 获取搜索建议     节流
  getSearchSugMobile( data ){
    searchSugMobileList = [];
    searchSugMobileList..add( data );
    if( atimer == null ){
      atimer = Timer( Duration( milliseconds: 600 ) , (){
        getSuggestRequest( data );
        atimer.cancel();
      });
    } else {
      atimer.cancel();
      atimer = Timer( Duration( milliseconds: 600 ) , (){
        getSuggestRequest( data );
        atimer.cancel();
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








