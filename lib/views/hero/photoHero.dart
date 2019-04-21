import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation ;



class PhotoHero extends StatelessWidget {

  final String photo;
  final VoidCallback ontap;
  final double width;

  PhotoHero({ this.photo, this.ontap, this.width });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: ontap,
            child: Image.network( photo, fit: BoxFit.contain, ),
          ),
        ),
      ),
    );
  }
}


class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("basic animation"),
      ),
      body: Center(
        child: PhotoHero(
          photo: "http://curtaintan.club/headImg/1549358122065.jpg",
          width: 300,
          ontap: (){
            Navigator.of(context).push(
              MaterialPageRoute( builder: (context){
                return Scaffold(
                  appBar: AppBar(
                    title: Text("-------"),
                  ),
                  body: Container(
                    color: Colors.lightBlueAccent,
                    padding: EdgeInsets.all( 16 ),
                    alignment: Alignment.topLeft,
                    child: PhotoHero(
                      photo: "http://curtaintan.club/headImg/1549358122065.jpg",
                      width: 100,
                      ontap: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              } )
            );
          },
        ),
      ),
    );
  }
}









