import 'package:flutter/material.dart';
import 'package:home_work/utils/screen_size.dart';
import 'package:home_work/widgets/banner_box.dart';

class SubjectDetail extends StatelessWidget {
  SubjectDetail();

  @override
  Widget build(BuildContext context) {
    ScreenSize ss = ScreenSize(context);
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            BannerBox(),
            Container(
              child: Text("subject details"),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: ss.sH(90)),
          alignment: Alignment.center,
          child: RaisedButton(
            child: Text(
              "Thank You",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            color: Colors.blue,
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
          ),
        )
      ],
    ));
  }
}
