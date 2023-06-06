import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:valoinfos/constants/enums.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/translations/locale_keys.g.dart';

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
            LottiePath.loading.name.lottiePath,
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
