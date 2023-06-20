import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Style {
  static EdgeInsetsGeometry pagePadding = EdgeInsets.all(80.r);
  static BorderRadius defaultRadius = BorderRadius.circular(16.r);
  static double defaultPaddingSizeVertical = 48.h; //16 ya denk geliyor
  static double defaultPaddingSizeHorizontal = 48.w; //16 ya denk geliyor
  static double defaultPaddingSize = 48.r;

  static const double defaultElevation = 10;
  static double defaultRadiusSize = 8.r;
  static EdgeInsetsGeometry defaultVerticalPadding = EdgeInsets.symmetric(
    vertical: 48.h,
  );
  static EdgeInsetsGeometry defaultHorizontalPadding = EdgeInsets.symmetric(
    horizontal: 48.h,
  );
  static EdgeInsetsGeometry defaultSymetricPadding = EdgeInsets.symmetric(
    vertical: 48.h,
    horizontal: 48.w,
  );

  static const int defautlCrossAxisCount = 2;
  static const int defaultMilisecond = 300;

  static const Color dateColor = Color.fromARGB(255, 117, 117, 117);
  static const Color starColor = Colors.amber;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color textColor = Color(0xffC6C6C6);
  static const Color iconColor = Color(0xffF3F3F3);
  static const Color lightTextColor = Color(0xffedf2f4);
  static const Color darkTextColor = Color(0xff2b2d42);
  static Color widgetBackgroundColor = Style.blackColor.withOpacity(0.6);
  static const Color transparentColor = Colors.transparent;

  static const Color primaryColor = Color(0xffEB565B);
  static const Color fabColor = primaryColor;
  static const Color movieTabColor = primaryColor;
  static const Color serieTabColor = Colors.blue;
  static const Color favoriteTabColor = Colors.purple;
  static const Color settingsTabColor = Colors.cyan;

  static double defaultIconsSize = 40.r;
  static double defaullIconHeight = 60.h;

  static double iconSizeTv = 72.r;

  static LinearGradient shimmerGradient() {
    return const LinearGradient(
      colors: [
        Color(0xFFEBEBF4),
        Color(0xFFF4F4F4),
        Color(0xFFEBEBF4),
      ],
      stops: [
        0.1,
        0.3,
        0.4,
      ],
      begin: Alignment(-1.0, -0.3),
      end: Alignment(1.0, 0.3),
      tileMode: TileMode.clamp,
    );
  }
}
