import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:valoinfos/product/utilities/extension.dart';
import 'package:valoinfos/product/utilities/style.dart';
import 'package:valoinfos/product/enums/lottie_constants.dart';
import 'package:valoinfos/product/utilities/translations/locale_keys.g.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            LottieConstants.loading.toLottie,
            width: 1000.w,
            height: 1000.h,
          ),
          Text(
            LocaleKeys.loading.tr(),
            style: context.theme.titleLarge!.copyWith(
              color: Style.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
