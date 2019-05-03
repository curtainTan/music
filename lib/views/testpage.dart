import 'package:flutter/material.dart';




class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  ScrollController _scrollController;

  double myof = 300;
  int index = 2;


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController( initialScrollOffset: 400 );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试页面"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemBuilder: ( context , index ){
          return ListTile(
            title: Text("----------这里是第${index}项---------"),
          );
        },
        itemCount: 40,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.access_alarm ),
        onPressed: (){
          // _scrollController.jumpTo( 200 );
          // _scrollController.animateTo(  200, duration: Duration( seconds: 2 ), curve: Curves.linear );
          print("点了一下");
          setState(() {
            myof = myof * index;
            index++;
          });
        },
      ),
    );
  }
}





















