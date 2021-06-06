import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        widget.card_selected_handler();
        setState(() {
          selected = selected ? false : true;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: ss.sW(5)),
        color: Colors.amber,
        child: Column(
          children: [
            Container(height: ss.sH(20), child: Image.network(widget.sub_image)

                // CachedNetworkImage(
                //   width: ss.sW(30),
                //   imageUrl: sub_image,
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.fill,
                //       ),
                //     ),
                //   ),
                //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                //       Center(
                //     child: CircularProgressIndicator(),
                //   ),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                // ),
                ),
            Row(
              children: [
                Container(
                  child: Checkbox(
                    value: selected,
                    onChanged: (bool value) {
                      widget.card_selected_handler();
                      setState(() {
                        selected = value;
                      });
                    },
                  ),
                ),
                Container(
                  child: Text(widget.sub_name),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
