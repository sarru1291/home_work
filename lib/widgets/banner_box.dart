import 'package:flutter/material.dart';
import 'package:home_work/utils/screen_size.dart';

class BannerBox extends StatelessWidget {
  BannerBox();

  @override
  Widget build(BuildContext context) {
    ScreenSize ss = ScreenSize(context);
    return Stack(children: [
      Container(
        alignment: Alignment.centerRight,
        height: ss.sH(25),
        child: Image.asset('assets/images/banner_image.png'),
      ),
      Container(
        margin: EdgeInsets.only(top: ss.sH(7),left: ss.sW(4)),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Teacher profile",
              style: TextStyle(color: Color(0xff270F36), fontSize: ss.sH(3),fontWeight: FontWeight.bold),
            ),
            Text(
              "Which grades &",
              style: TextStyle(color: Color(0xff270F36),fontWeight: FontWeight.bold, fontSize: ss.sH(4.5)),
            ),
            Text("subjects you teach",
            style: TextStyle(color: Color(0xff270F36), fontWeight: FontWeight.bold,fontSize: ss.sH(4.5))),
          ],
        ),
      )
    ]);
  }
}
