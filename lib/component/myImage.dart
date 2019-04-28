import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';



class MyImage extends StatefulWidget {

  String url;
  double w, h;
  BoxFit b;
  BoxShape shape;
  double br;

  MyImage({ 
    this.url, 
    this.w, 
    this.h, 
    this.b = BoxFit.cover, 
    this.shape = BoxShape.rectangle, 
    this.br = 0 });

  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {

  @override
  Widget build(BuildContext context) {

    return ExtendedImage.network(
      widget.url,
      cache: true,
      shape: widget.shape,
      borderRadius: BorderRadius.all( Radius.circular( widget.br ) ),
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            double w;
            if( widget.w > widget.h ){
              w = widget.h;
            }else{
              w = widget.w;
            }
            return Container(
              width: w,
              height: w,
              alignment: Alignment.center,
              child: Image.asset(
                "asset/image/loading/loding3.gif",
                fit: BoxFit.fitWidth,
              ),
            );
            break;
          case LoadState.completed:
            return ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              width: widget.w,
              height: widget.h,
              fit: widget.b,
            );
            break;
          case LoadState.failed:
            return GestureDetector(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    "asset/image/ape.png",
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Text(
                      "图片加载失败....",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              onTap: () {
                state.reLoadImage();
              },
            );
            break;
        }
      },
    );
  }
}







