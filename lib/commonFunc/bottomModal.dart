import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




Widget oneModalMenu( context, int icon, String text, int type ){
  return InkWell(
    splashColor: Colors.white,
    highlightColor: Colors.blue,
    onTap: (){
      Navigator.pop(context, type);
    },
    child: Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth( 20 )
            ),
            width: ScreenUtil().setWidth( 100 ),
            child: Icon( IconData( icon, fontFamily: "iconfont" ), size: ScreenUtil().setSp( 42 ), color: Colors.white, ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: ScreenUtil().setWidth( 960 ),
            height: ScreenUtil().setHeight( 150 ),
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth( 10 )
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: ScreenUtil().setWidth( 1 )
                )
              )
            ),
            child: Text( text ?? "-", style: TextStyle( color: Colors.white, fontSize: ScreenUtil().setSp( 34 ) ), ),
          )
        ],
      ),
    ),
  );
}

Future<int> myShowModal( context, List<int> iconList, List<String> textList ) async {
  int tan = -1;
  tan = await showModalBottomSheet(
    context: context,
    builder: ( context ){
      return GestureDetector(
        onTap: (){},
        child: Container(
          color: Colors.black54,
            child: Container(
              decoration: BoxDecoration(
                color: Color( 0xFF596275 ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular( 20 )
                )
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight( 150 ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth( 30 )
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: ScreenUtil().setHeight( 1 )
                        )
                      )
                    ),
                    child: Text("创建的歌单", style: TextStyle( color: Colors.white, fontSize: ScreenUtil().setSp( 32 ) ),),
                  ),
                  Container(
                    height: ScreenUtil().setHeight( iconList.length > 6 ? 930 : 150.0 * iconList.length + 30 ),
                    child: ListView.builder(
                      physics: iconList.length > 6 ? ScrollPhysics() : NeverScrollableScrollPhysics(),
                      itemBuilder: ( context, index ){
                        if( index == iconList.length ){
                          return SizedBox(
                            height: ScreenUtil().setHeight( 30 ),
                          );
                        } else {
                          return oneModalMenu( context, iconList[index], textList[index], index );
                        }
                      },
                      itemCount: iconList.length + 1 ,
                    ),
                  ),
                ],
              )
            ),
        ),
      );
    }
  ).then((onValue){
    return onValue;
  });
  return tan;
}



















