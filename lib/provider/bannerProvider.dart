import 'package:flutter/material.dart';


import '../modal/banner.dart';
import '../modal/tuijian.dart';




// 所有ui相关的数据

class BannerProvide with ChangeNotifier{
  MyBanner myBanner = null;
  Tuijian tuijian = null;

  setBanner( data ){

    // print("--------banner---数据${ data }");
    myBanner = MyBanner.fromJson( data );

    notifyListeners();

  }

  setTuijian( data ){

    tuijian = Tuijian.fromJson( data );

    notifyListeners();

  }
  
}







