import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/pages/char_page.dart';
import 'package:valoinfos/pages/gun_page.dart';
import 'package:valoinfos/pages/map_page.dart';
import 'package:valoinfos/pages/news_page.dart';
import 'package:valoinfos/provider/locale_provider.dart';
import 'package:valoinfos/utilities/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bottomData = [
      {
        "title": "guns".tr(),
        "icon": "assets/logo/weap.svg",
        "onPressed": const GunPage(),
      },
      {
        "title": "characters".tr(),
        "icon": "assets/logo/char.svg",
        "onPressed": const CharPage(),
      },
      {
        "title": "maps".tr(),
        "icon": "assets/logo/map-marker.svg",
        "onPressed": const MapPage(),
      },
      {
        "title": "news".tr(),
        "icon": "assets/logo/news.svg",
        "onPressed": const NewsPage(),
      },
    ];
    FlutterNativeSplash.remove();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 36.w),
          padding: EdgeInsets.only(left: 24.w),
          child: SvgPicture.asset(
            "assets/logo/v2.svg",
            color: Style().secondaryColor,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 36.w),
            child: SvgPicture.asset(
              "assets/logo/v1.svg",
              color: Style().secondaryColor,
              height: 60.h,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: defPagePadd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32.h),
                child: Text(
                  "VALORANT INFO",
                  style: TextStyle(
                    fontSize: 82.sp,
                    color: Style().textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 64.h),
                child: Text(
                  "welcome".tr(),
                  style: TextStyle(
                    fontSize: 52.sp,
                    color: Style().textColor,
                  ),
                ),
              ),
              GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => bottomData[index]["onPressed"],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.14),
                        borderRadius: BorderRadius.circular(defRadius),
                      ),
                      padding: EdgeInsets.all(36.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            bottomData[index]["icon"],
                            height: 250.h,
                            color: Style().textColor.withOpacity(0.8),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              bottomData[index]["title"],
                              style: TextStyle(
                                color: Style().textColor.withOpacity(0.8),
                                fontSize: 64.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 48.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<LanguageProvider>()
                              .changeLanguage(context, Language.tr);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Style().secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              "TR",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<LanguageProvider>()
                            .changeLanguage(context, Language.en);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Style().secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            "EN",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<LanguageProvider>()
                            .changeLanguage(context, Language.ar);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Style().secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            "AR",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: const Text("Valorant"),
    );
  }
}
