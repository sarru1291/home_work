import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            BannerBox(),
            ...classData
              .map((data)=>ClassItem(standard: data["standard"],subjects: data["subjects"],)).toList()
          ],
        ),
      ),
    );
  }
}
