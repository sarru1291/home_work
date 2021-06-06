import 'package:flutter/material.dart';
import 'package:home_work/utils/screen_size.dart';
import 'package:home_work/widgets/card_view.dart';

class ClassItem extends StatelessWidget {
  final String standard;
  final List subjects;
  final Function card_selected;
  ClassItem({this.standard, this.card_selected,this.subjects});
  void cardSelectedHandler() {
    card_selected();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize ss = ScreenSize(context);
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(standard),
          ),
          Container(
            height: ss.sH(30),
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: subjects
                  .map((sub) => CardView(
                        sub_image: sub["subject_image"],
                        sub_name: sub["subject_name"],
                        card_selected_handler: cardSelectedHandler
                      ))
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
