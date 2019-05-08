import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import './search_suggest.dart';
import './init_page.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String searchText = "";
  TextEditingController _textEditingController;
  bool showSuggest = false;

  @override
  void initState() {
    _textEditingController = TextEditingController();
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
          body: SingleChildScrollView(
            child: InitSearchPage(),
          ),
        ),
        showSuggest ? SearchSuggest( functionShow: controlerShow, ) : Container()
      ],
    );
  }
}












