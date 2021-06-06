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
  List<SelectedCard> selectedCards = [];

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

  bool isContain(SelectedCard card) {
    if (selectedCards.isEmpty) {
      return false;
    }
    for (var i = 0; i < selectedCards.length; i++) {
      if (selectedCards[i].standard == card.standard &&
          selectedCards[i].subject == card.subject) {
        return true;
      }
    }
    return false;
  }

  void cardSelected(SelectedCard card) {
    if (mounted) {
      setState(() {
        if (isContain(card)) {
          selectedCards.remove(card);
        } else {
          selectedCards.add(card);
        }
        if (selectedCards.length > 0) {
          card_selected = true;
        } else {
          card_selected = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ss = ScreenSize(context);
    print("length of selected cards: ${selectedCards.length}");
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
          Positioned(
            bottom: 5.0,
            left: 3.0,
            right: 3.0,
            height: ss.sH(10),
            child: InkWell(
              onTap: card_selected
            ? () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return SubjectDetail(
                    cards: selectedCards,
                  );
                }));
              }
            : null,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: !card_selected ? Colors.grey : Color(0xff270F36),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: ss.sH(2)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
