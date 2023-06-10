import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:valoinfos/constants/enums.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/translations/locale_keys.g.dart';

class RateAppInitWidget extends StatefulWidget {
  const RateAppInitWidget({super.key, required this.builder});
  final Widget Function(RateMyApp) builder;

  @override
  State<RateAppInitWidget> createState() => _RateAppInitWidgetState();
}

class _RateAppInitWidgetState extends State<RateAppInitWidget> {
  RateMyApp? rateMyApp;
  static const String playStoreId = "com.emirgozcu.valoinfos";
  @override
  Widget build(BuildContext context) {
    return RateMyAppBuilder(
      rateMyApp: RateMyApp(
        googlePlayIdentifier: playStoreId,
        minDays: 0,
        minLaunches: 2,
        remindLaunches: 2,
        remindDays: 1,
      ),
      onInitialized: (context, rateMyApp) {
        setState(() {
          this.rateMyApp = rateMyApp;
        });
        if (rateMyApp.shouldOpenDialog) {
          rateMyApp.showRateDialog(
            barrierDismissible: true,
            contentBuilder: (context, defaultContent) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(LottiePath.rate.name.lottiePath, height: 400.h),
                  Text(LocaleKeys.rateContent.tr(), textAlign: TextAlign.center),
                ],
              );
            },
            context,
            title: LocaleKeys.rateTitle.tr(),
            rateButton: LocaleKeys.rateButton.tr(),
            noButton: LocaleKeys.noButton.tr(),
            laterButton: LocaleKeys.laterButton.tr(),
            dialogStyle: DialogStyle(
              titleStyle: const TextStyle(color: Style.primaryColor),
              titleAlign: TextAlign.center,
              dialogShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Style.defaultRadiusSize),
                side: BorderSide(color: Style.primaryColor, width: Style.defaultPaddingSize * 0.15),
              ),
              contentPadding: EdgeInsets.zero,
            ),
            onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
          );
        }
      },
      builder: (context) => rateMyApp == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : widget.builder(rateMyApp!),
    );
  }
}
