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

  static TextTheme _getTextTheme(Color color) => TextTheme(
        ///  display-large
        displayLarge: TextStyle(fontSize: 288.0.sp, fontWeight: FontWeight.w300, color: color, wordSpacing: -1.5),

        ///  display-medium
        displayMedium: TextStyle(fontSize: 180.0.sp, fontWeight: FontWeight.w300, color: color, wordSpacing: -0.5),

        ///  display-small
        displaySmall: TextStyle(fontSize: 144.0.sp, fontWeight: FontWeight.w400, color: color, wordSpacing: 0.0),

        ///  headline-medium
        headlineMedium: TextStyle(fontSize: 102.0.sp, fontWeight: FontWeight.w400, color: color, wordSpacing: 0.25),

        ///  headline-small
        headlineSmall: TextStyle(fontSize: 72.0.sp, fontWeight: FontWeight.w400, color: color, wordSpacing: 0.0),

        ///  title-large
        titleLarge: TextStyle(fontSize: 60.0.sp, fontWeight: FontWeight.w600, color: color, wordSpacing: 0.15),

        ///  title-medium
        titleMedium: TextStyle(fontSize: 48.0.sp, fontWeight: FontWeight.w400, color: color, wordSpacing: 0.15),

        ///  title-small
        titleSmall: TextStyle(fontSize: 42.0.sp, fontWeight: FontWeight.w500, color: color, wordSpacing: 0.1),

        ///  body-large
        bodyLarge: TextStyle(fontSize: 44.0.sp, fontWeight: FontWeight.w400, color: color, wordSpacing: 0.5),

        ///  body-medium
        bodyMedium: TextStyle(fontSize: 42.0.sp, fontWeight: FontWeight.w400, color: color, wordSpacing: 0.25),

        ///  body-small
        bodySmall: TextStyle(fontSize: 38.0.sp, fontWeight: FontWeight.w500, color: color, wordSpacing: 1.25),

        ///  label-large
        labelLarge: TextStyle(fontSize: 36.0.sp, fontWeight: FontWeight.w400, color: color, wordSpacing: 0.4),

        ///  label-small
        labelSmall: TextStyle(fontSize: 30.0.sp, fontWeight: FontWeight.w400, color: color, wordSpacing: 1.5),
      );
}
