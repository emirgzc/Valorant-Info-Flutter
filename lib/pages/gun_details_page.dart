import 'package:bordered_text/bordered_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:valoinfos/model/gun_api_model.dart';
import 'package:valoinfos/pages/gun_skins_page.dart';
import 'package:valoinfos/utilities/reklam.dart';
import 'package:valoinfos/utilities/style.dart';

class GunDetailsPage extends StatefulWidget {
  GunDetailsPage({Key? key, required this.gunApiModel}) : super(key: key) {
    initAd();
  }
  final Data gunApiModel;

  @override
  State<GunDetailsPage> createState() => _GunDetailsState();
  late InterstitialAd interstitialAd;
  bool isAdLoaded = false;

  void initAd() {
    InterstitialAd.load(
      adUnitId: reklamGecis,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    interstitialAd = ad;
    isAdLoaded = true;

    interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        interstitialAd.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        interstitialAd.dispose();
      },
    );
  }
}

class _GunDetailsState extends State<GunDetailsPage> {
  late BannerAd staticAd;
  bool staticAdLoaded = false;
  late BannerAd inlineAd;
  bool inlineAdloaded = false;

  static const AdRequest request = AdRequest();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadInlineBannerAd();
  }

  void loadStaticBannerAd() {
    staticAd = BannerAd(
      adUnitId: reklamBanner,
      size: AdSize.banner,
      request: request,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(
            () {
              staticAdLoaded = true;
            },
          );
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint("error : ${error.message}");
        },
      ),
    );
    staticAd.load();
  }

  void loadInlineBannerAd() {
    inlineAd = BannerAd(
      adUnitId: reklamBanner,
      size: AdSize.banner,
      request: request,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(
            () {
              inlineAdloaded = true;
            },
          );
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint("error : ${error.message}");
        },
      ),
    );
    inlineAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: gunDetailBody(),
    );
  }

  Widget gunDetailBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          gunImageAndText(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 90.h, horizontal: 40.w),
            child: gunInfos(),
          ),
        ],
      ),
    );
  }

  Widget gunInfos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 60.h),
          child: bigTitle("titleGun".tr()),
        ),
        titleRow(
          "${"nameGun".tr()} : ",
          widget.gunApiModel.displayName.toString(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: titleRow(
            "${"typeGun".tr()} : ",
            widget.gunApiModel.shopData?.categoryText!.toString(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: titleWithIcon(),
        ),
        Row(
          children: [
            Text(
              "${"fireRateGun".tr()} : ",
              style: TextStyle(fontSize: 48.sp, color: Style().textColor),
            ),
            widget.gunApiModel.weaponStats.toString() == "null"
                ? Text(
                    "0",
                    style: TextStyle(
                      fontSize: 48.sp,
                      color: Style().secondaryColor,
                    ),
                  )
                : Text(
                    " ${widget.gunApiModel.weaponStats!.fireRate}",
                    style: TextStyle(
                      fontSize: 48.sp,
                      color: Style().secondaryColor,
                    ),
                  ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Row(
            children: [
              Text(
                "${"armorLenght".tr()} : ",
                style: TextStyle(fontSize: 48.sp, color: Style().textColor),
              ),
              widget.gunApiModel.weaponStats.toString() == "null"
                  ? Text(
                      "0",
                      style: TextStyle(
                        fontSize: 48.sp,
                        color: Style().secondaryColor,
                      ),
                    )
                  : Text(
                      " ${widget.gunApiModel.weaponStats!.magazineSize}",
                      style: TextStyle(
                        fontSize: 48.sp,
                        color: Style().secondaryColor,
                      ),
                    ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: Row(
            children: [
              bigTitle("damageInfo".tr()),
            ],
          ),
        ),
        widget.gunApiModel.weaponStats != null
            ? ListView.builder(
                itemCount: widget.gunApiModel.weaponStats!.damageRanges!.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 60.h),
                        child: Row(
                          children: [
                            Text(
                              "${widget.gunApiModel.weaponStats!.damageRanges![index].rangeStartMeters!}m - ${widget.gunApiModel.weaponStats!.damageRanges![index].rangeEndMeters}m",
                              style: TextStyle(
                                fontSize: 60.sp,
                                color: Style().textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        child: indicatorItem(
                          index,
                          "headName".tr(),
                          widget.gunApiModel.weaponStats!.damageRanges![index]
                              .headDamage
                              .toString(),
                        ),
                      ),
                      linearIndicator(
                        index,
                        widget.gunApiModel.weaponStats!.damageRanges![index]
                            .headDamage
                            .toString(),
                        0.7,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        child: indicatorItem(
                          index,
                          "bodyName".tr(),
                          widget.gunApiModel.weaponStats!.damageRanges![index]
                              .bodyDamage
                              .toString(),
                        ),
                      ),
                      linearIndicator(
                        index,
                        widget.gunApiModel.weaponStats!.damageRanges![index]
                            .bodyDamage
                            .toString(),
                        0.4,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        child: indicatorItem(
                          index,
                          "legsName".tr(),
                          widget.gunApiModel.weaponStats!.damageRanges![index]
                              .legDamage
                              .toString(),
                        ),
                      ),
                      linearIndicator(
                        index,
                        widget.gunApiModel.weaponStats!.damageRanges![index]
                            .legDamage
                            .toString(),
                        0.15,
                      ),
                      index ==
                              widget.gunApiModel.weaponStats!.damageRanges!
                                      .length -
                                  1
                          ? Container()
                          : Container(
                              margin: EdgeInsets.only(top: 60.h),
                              height: 3.h,
                              width: double.infinity,
                              color: Style().textColor.withOpacity(0.4),
                            ),
                    ],
                  );
                },
              )
            : Text(
                "--Not Found--",
                style: TextStyle(
                  color: Style().textColor,
                  fontSize: 60.sp,
                ),
              ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 32.h),
          width: inlineAd.size.width.toDouble(),
          height: inlineAd.size.height.toDouble(),
          child: AdWidget(
            ad: inlineAd,
          ),
        ),
      ],
    );
  }

  Widget linearIndicator(int index, String? data, double percent) {
    return LinearPercentIndicator(
      barRadius: Radius.circular(defRadius),
      animation: true,
      lineHeight: 70.h,
      padding: EdgeInsets.zero,
      animationDuration: 1300,
      percent: percent,
      center: Text(
        data ?? "",
      ),
      progressColor: Style().secondaryColor,
    );
  }

  Widget indicatorItem(int index, String title, String? data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 48.sp,
            color: Style().textColor,
          ),
        ),
        Text(
          data ?? "",
          style: TextStyle(
            fontSize: 48.sp,
            color: Style().textColor,
          ),
        ),
      ],
    );
  }

  Widget titleWithIcon() {
    return Row(
      children: [
        Text(
          "${"priceGun".tr()} : ",
          style: TextStyle(fontSize: 48.sp, color: Style().textColor),
        ),
        Image.asset("assets/char/creditIcon.webp"),
        widget.gunApiModel.shopData.toString() == "null"
            ? Text(
                "Ücretsiz",
                style: TextStyle(
                  fontSize: 48.sp,
                  color: Style().secondaryColor,
                ),
              )
            : Text(
                " ${widget.gunApiModel.shopData!.cost}",
                style: TextStyle(
                  fontSize: 48.sp,
                  color: Style().secondaryColor,
                ),
              ),
      ],
    );
  }

  Widget titleRow(String title, String? data) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 48.sp,
            color: Style().textColor,
          ),
        ),
        Text(
          data ?? "",
          style: TextStyle(
            fontSize: 48.sp,
            color: Style().secondaryColor,
          ),
        ),
      ],
    );
  }

  Widget bigTitle(String bigTitle) {
    return Row(
      children: [
        Text(
          bigTitle,
          style: TextStyle(
            fontSize: 74.sp,
            color: Style().textColor,
          ),
        ),
      ],
    );
  }

  Widget gunImageAndText() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 120.h,
        horizontal: 40.w,
      ),
      width: double.infinity,
      color: Style().secondaryColor,
      child: Stack(
        children: [
          Positioned(
            bottom: -42.h,
            child: BorderedText(
              strokeWidth: 1.0,
              strokeColor: Style().iconColor.withOpacity(0.7),
              child: Text(
                widget.gunApiModel.displayName.toString(),
                style: TextStyle(
                  color: Style().secondaryColor,
                  fontSize: 180.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Image.network(
              widget.gunApiModel.displayIcon.toString(),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 190.h,
      backgroundColor: Style().secondaryColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Style().iconColor,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 40.w, top: 30.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Style().primaryColor,
          ),
          child: IconButton(
            onPressed: () {
              if (widget.isAdLoaded) {
                widget.interstitialAd.show();
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return GunSkinPage(
                      skinsUid: widget.gunApiModel.skins,
                    );
                  },
                ),
              );
            },
            icon: Icon(
              Icons.menu,
              color: Style().iconColor,
            ),
          ),
        ),
      ],
    );
  }
}
