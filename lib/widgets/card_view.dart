import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:home_work/utils/screen_size.dart';

class CardView extends StatelessWidget {
  final String sub_name;
  final String sub_image;
  final Function card_selected_handler;
  CardView({this.sub_image, this.sub_name, this.card_selected_handler});

  @override
  Widget build(BuildContext context) {
    ScreenSize ss = ScreenSize(context);
    return InkWell(
      onTap: () {
        card_selected_handler();
      },
      child: Container(
        child: Column(
          children: [
            Container(
              child: CachedNetworkImage(
                width: ss.sW(30),
                imageUrl: sub_image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Row(
              children: [
                Container(
                  child: Checkbox(
                    value: false,
                    onChanged: (bool value) {
                      // setState(() {
                      //   isChecked = value!;
                      // });
                    },
                  ),
                ),
                Container(
                  child: Text(sub_name),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
