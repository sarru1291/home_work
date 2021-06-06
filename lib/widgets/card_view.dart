import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:home_work/model/selected_card.dart';
import 'package:home_work/utils/screen_size.dart';

class CardView extends StatefulWidget {
  final String sub_name;
  final String sub_image;
  final Function card_selected_handler;

  CardView({this.sub_image, this.sub_name, this.card_selected_handler});

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    ScreenSize ss = ScreenSize(context);
    return InkWell(
      onTap: () {
        widget.card_selected_handler(widget.sub_name);
        setState(() {
          selected = selected ? false : true;
        });
      },
      child: Container(
        clipBehavior: Clip.values.last,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.all(ss.sW(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xffFAF1F0),
              height: ss.sH(20),
              child: Image.network(
                widget.sub_image,
              ),
            ),
            Row(
              children: [
                Container(
                  child: Checkbox(
                    value: selected,
                    checkColor: Colors.white,
                    activeColor: Color(0xff270F36),
                    onChanged: (bool value) {
                      widget.card_selected_handler(widget.sub_name);
                      setState(() {
                        selected = value;
                      });
                    },
                  ),
                ),
                Container(
                  child: Text(widget.sub_name, style: TextStyle(fontWeight: FontWeight.bold),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
