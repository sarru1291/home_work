import 'package:flutter/material.dart';
import 'package:home_work/utils/screen_size.dart';
import 'package:home_work/widgets/card_view.dart';

class ClassItem extends StatelessWidget {
  final String standard;
  final List subjects;
 
   ClassItem({this.standard,this.subjects});

  @override
  Widget build(BuildContext context) {
    ScreenSize ss=ScreenSize(context);
    return Container(
      child: Column(children: [
        Container(child: Text(standard),),

        Container(height: ss.sH(20),child: 
        ListView(
  // This next line does the trick.
  scrollDirection: Axis.horizontal,
  children: subjects.map((sub) => CardView(sub_image: sub["subject_image"],sub_name: sub["subject_name"],)).toList(),
)
,)
      ],),
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