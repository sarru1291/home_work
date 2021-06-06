import 'package:flutter/material.dart';
import 'package:home_work/model/selected_card.dart';
import 'package:home_work/utils/screen_size.dart';

class SelectedCardBox extends StatelessWidget {
  final SelectedCard selectedCard;
  SelectedCardBox({this.selectedCard});

  @override
  Widget build(BuildContext context) {
        ScreenSize ss = ScreenSize(context);

    return Container(
      margin: EdgeInsets.all(5.0),
      height: ss.sH(8),
      alignment: Alignment.centerLeft,
       decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: ss.sH(5),
            width: ss.sW(10),
            margin: EdgeInsets.only(left: ss.sW(4)),
            padding: EdgeInsets.all(1),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xff270F36),
            ),
            child: Text(
              selectedCard.standard,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            
          ),
          Container(
            margin: EdgeInsets.only(left: ss.sW(2)),
                  child: Text(selectedCard.subject, style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff270F36)),),
                )
      ],),
    );
  }
}
