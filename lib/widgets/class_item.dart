import 'package:flutter/material.dart';
import 'package:home_work/model/selected_card.dart';
import 'package:home_work/utils/screen_size.dart';
import 'package:home_work/widgets/card_view.dart';

class ClassItem extends StatelessWidget {
  final String standard;
  final List subjects;
  final Function card_selected;

  ClassItem({this.standard, this.card_selected, this.subjects});


  @override
  Widget build(BuildContext context) {
    ScreenSize ss = ScreenSize(context);
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xffF2F2F2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: ss.sW(5), top: ss.sH(2)),
            height: ss.sH(5),
            width: ss.sW(10),
            padding: EdgeInsets.all(1),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xff270F36),
            ),
            child: Text(
              standard,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: ss.sH(35),
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: subjects
                  .map((sub) => CardView(
                      sub_image: sub["subject_image"],
                      sub_name: sub["subject_name"],
                      card_selected_handler:(e){
                        card_selected(SelectedCard(subject: e,standard: standard));
                      } ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

// ListView(
//   // This next line does the trick.
//   scrollDirection: Axis.horizontal,
//   children: <Widget>[
//     Container(
//       width: 160.0,
//       color: Colors.red,
//     ),
//     Container(
//       width: 160.0,
//       color: Colors.blue,
//     ),
//     Container(
//       width: 160.0,
//       color: Colors.green,
//     ),
//     Container(
//       width: 160.0,
//       color: Colors.yellow,
//     ),
//     Container(
//       width: 160.0,
//       color: Colors.orange,
//     ),
//   ],
// )
