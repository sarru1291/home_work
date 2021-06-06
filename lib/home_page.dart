import 'package:flutter/material.dart';
import 'package:home_work/model/selected_card.dart';
import 'package:home_work/subject_detail.dart';
import 'package:home_work/utils/screen_size.dart';
import 'package:home_work/widgets/banner_box.dart';
import 'package:home_work/widgets/class_item.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loaded = false;
  List<ClassItem> classess = [];
  List classData = [];
  ScreenSize ss;
  bool card_selected = false;
  List<SelectedCard> selectedCards;

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = await json.decode(response);
      if (mounted) {
        setState(() {
          loaded = true;
          classData = data['classess'];
        });
      }
    } catch (e) {
      print("error found");
    }
  }

  void cardSelected(SelectedCard card) {
    if (mounted) {
      setState(() {
        if (selectedCards.contains(card)) {
          selectedCards.remove(card);
        } else {
          selectedCards.add(card);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ss = ScreenSize(context);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                BannerBox(),
                ...classData
                    .map((data) => ClassItem(
                          standard: data["standard"],
                          subjects: data["subjects"],
                          card_selected: cardSelected,
                        ))
                    .toList()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ss.sH(90)),
            alignment: Alignment.center,
            child: RaisedButton(
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: card_selected
                  ? () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return SubjectDetail();
                      }));
                    }
                  : null,
              color: card_selected ? Colors.blue : Colors.grey,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
            ),
          )
        ],
      ),
    );
  }
}
