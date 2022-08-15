import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Style {
  Color primaryColor = const Color(0xff313130);
  Color secondaryColor = const Color(0xffEB565B);
  Color textColor = const Color(0xffC6C6C6);
  Color iconColor = const Color(0xffF3F3F3);
}

EdgeInsets defPagePadd = EdgeInsets.symmetric(horizontal: 40.w, vertical: 32.h);
double defRadius = 16.r;

buildLastProcessCardEffect(Widget widget, BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.2),
    highlightColor: Colors.grey.withOpacity(0.05),
    child: widget,
  );
}
