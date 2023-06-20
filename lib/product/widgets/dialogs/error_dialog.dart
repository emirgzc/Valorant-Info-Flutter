import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:valoinfos/product/utilities/extension.dart';
import 'package:valoinfos/product/utilities/style.dart';
import 'package:valoinfos/product/enums/lottie_constants.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.message, required this.content});
  final String message;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: Style.pagePadding / 2,
        decoration: BoxDecoration(
          border: Border.all(width: 16.w, color: Style.primaryColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
             LottieConstants.error.toLottie,
              height: 550.h,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Style.defaultPaddingSize),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: context.theme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Style.primaryColor,
                ),
              ),
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: context.theme.bodyMedium!.copyWith(
                color: Style.darkTextColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Style.defaultPaddingSize * 0.7),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Style.primaryColor,
                  elevation: Style.defaultElevation,
                  shadowColor: Style.primaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Center(child: Text('Tamam')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
