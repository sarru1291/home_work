import 'package:flutter/widgets.dart';

class ScreenSize {
  MediaQueryData _mediaQueryData;
  double screenWidth; //sW
  double screenHeight; //sH
  BuildContext _context;

  ScreenSize(this._context) {
    _mediaQueryData = MediaQuery.of(_context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  double sH(double v) {
    return (screenHeight * v) / 100;
  }

  double sW(double v) {
    return (screenWidth * v) / 100;
  }
}
