import 'package:flutter/material.dart';
import 'package:home_work/model/selected_card.dart';
import 'package:home_work/utils/screen_size.dart';
import 'package:home_work/widgets/banner_box.dart';
import 'package:home_work/widgets/selected_card_box.dart';

class SubjectDetail extends StatelessWidget {
  final List<SelectedCard> cards;
  SubjectDetail({this.cards});

  @override
  Widget build(BuildContext context) {
    ScreenSize ss = ScreenSize(context);
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          children: [
            BannerBox(),
            ...cards.map((e) => SelectedCardBox(selectedCard: e,))
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(top: ss.sH(89),bottom: ss.sH(2)),
            alignment: Alignment.center,
            width: ss.sW(80),
            height: ss.sH(40),
            decoration: BoxDecoration( 
              color: Color(0xff270F36),
               borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
              ),
            child: Text("Thank You",style: TextStyle(color: Colors.white,fontSize: ss.sH(2)),),
          ),
        )
      ],
    ));
  }
}
