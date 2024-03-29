import 'package:bordered_text/bordered_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:valoinfos/product/constants/string_constants.dart';
import 'package:valoinfos/product/utility/extension.dart';
import 'package:valoinfos/product/utility/style.dart';
import 'package:valoinfos/product/models/gun_api_model.dart';
import 'package:valoinfos/feature/gun/gun_skins_page.dart';
import 'package:valoinfos/product/utility/translations/locale_keys.g.dart';
import 'package:valoinfos/product/widgets/custom_appbar.dart';
import 'package:valoinfos/product/widgets/packages/cache_image.dart';

class GunDetailsPage extends StatefulWidget {
  const GunDetailsPage({Key? key, required this.gunApiModel}) : super(key: key);
  final DataGun gunApiModel;

  @override
  State<GunDetailsPage> createState() => _GunDetailsState();
}

class _GunDetailsState extends State<GunDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: gunDetailBody(),
    );
  }

  Widget gunDetailBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: Style.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gunImage(),
            gunInfos(),
            SizedBox(height: 200.h),
          ],
        ),
      ),
    );
  }

  Widget gunImage() {
    return Container(
      margin: EdgeInsets.only(bottom: 60.h),
      padding: EdgeInsets.symmetric(
        vertical: Style.defaultPaddingSize,
        horizontal: Style.defaultPaddingSize / 2,
      ),
      decoration: BoxDecoration(
        color: Style.primaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(Style.defaultRadiusSize),
      ),
      child: Center(
        child: Hero(
          tag: widget.gunApiModel.uuid ?? StringConstants.noData,
          child: CacheImage(
            image: widget.gunApiModel.displayIcon,
            fit: BoxFit.contain,
            height: 270.h,
          ),
        ),
      ),
    );
  }

  Widget gunTitle() {
    return BorderedText(
      strokeWidth: 1.0,
      strokeColor: Style.primaryColor.withOpacity(0.7),
      child: Text(
        widget.gunApiModel.displayName ?? StringConstants.noData,
        style: TextStyle(
          color: Style.primaryColor,
          fontSize: 100.sp,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 5,
              color: Style.primaryColor.withOpacity(0.16),
              offset: const Offset(4, 7),
            ),
          ],
        ),
      ),
    );
  }

  Widget gunInfos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* Padding(
          padding: EdgeInsets.only(bottom: 60.h),
          child: bigTitle("titleGun".tr()),s
        ), */
        Padding(
          padding: EdgeInsets.only(bottom: Style.defaultPaddingSize),
          child: gunTitle(),
        ),
        /* titleRow(
          "${LocaleKeys.nameGun.tr()} : ",
          widget.gunApiModel.displayName,
        ), */
        Padding(
          padding: EdgeInsets.only(bottom: ((Style.defaultPaddingSize / 2) * 5).h),
          child: titleRow(
            "${LocaleKeys.typeGun.tr()} : ",
            widget.gunApiModel.shopData?.categoryText ?? StringConstants.noData,
          ),
        ),
        gunInfoRow(
          "${LocaleKeys.fireRateGun.tr()} : ",
          widget.gunApiModel.weaponStats?.fireRate.toString() ?? StringConstants.noData,
        ),
        Padding(
          padding: EdgeInsets.only(top: Style.defaultPaddingSize),
          child: gunInfoRow(
            "${LocaleKeys.armorLenght.tr()} : ",
            widget.gunApiModel.weaponStats?.magazineSize.toString() ?? StringConstants.noData,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Style.defaultPaddingSize),
          child: buttons(),
        ),
        Padding(
          padding: EdgeInsets.only(top: Style.defaultPaddingSize * 1.4),
          child: Row(
            children: [
              widget.gunApiModel.weaponStats != null ? bigTitle(LocaleKeys.damageInfo.tr()) : const SizedBox.shrink(),
            ],
          ),
        ),
        widget.gunApiModel.weaponStats != null ? damageList() : const SizedBox.shrink(),
      ],
    );
  }

  Widget gunInfoRow(String title, String? item) {
    return Row(
      children: [
        Text(
          title,
          style: context.theme.titleMedium!.copyWith(
            color: Style.darkTextColor,
          ),
        ),
        Text(
          item ?? StringConstants.noData,
          style: context.theme.titleMedium!.copyWith(
            color: Style.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget damageList() {
    return ListView.builder(
      itemCount: widget.gunApiModel.weaponStats!.damageRanges!.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Style.defaultPaddingSize * 1),
              child: Row(
                children: [
                  Text(
                    "${widget.gunApiModel.weaponStats?.damageRanges?[index].rangeStartMeters ?? StringConstants.noData}m - ${widget.gunApiModel.weaponStats?.damageRanges?[index].rangeEndMeters ?? StringConstants.noData}m",
                    style: context.theme.titleLarge!.copyWith(
                      color: Style.darkTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Style.defaultPaddingSize * 0.5),
              child: indicatorItem(
                index,
                LocaleKeys.headName.tr(),
                widget.gunApiModel.weaponStats?.damageRanges?[index].headDamage.toString(),
              ),
            ),
            linearIndicator(
              index,
              widget.gunApiModel.weaponStats?.damageRanges?[index].headDamage.toString(),
              0.7,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Style.defaultPaddingSize * 0.4),
              child: indicatorItem(
                index,
                LocaleKeys.bodyName.tr(),
                widget.gunApiModel.weaponStats?.damageRanges?[index].bodyDamage.toString(),
              ),
            ),
            linearIndicator(
              index,
              widget.gunApiModel.weaponStats?.damageRanges?[index].bodyDamage.toString(),
              0.4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Style.defaultPaddingSize * 0.4),
              child: indicatorItem(
                index,
                LocaleKeys.legsName.tr(),
                widget.gunApiModel.weaponStats?.damageRanges?[index].legDamage.toString(),
              ),
            ),
            linearIndicator(
              index,
              widget.gunApiModel.weaponStats?.damageRanges?[index].legDamage.toString(),
              0.15,
            ),
            index == (widget.gunApiModel.weaponStats?.damageRanges?.length ?? 0) - 1 ? const SizedBox.shrink() : divider(),
          ],
        );
      },
    );
  }

  Widget divider() {
    return Container(
      margin: EdgeInsets.only(top: 60.h),
      height: 3.h,
      width: double.infinity,
      color: Style.darkTextColor.withOpacity(0.4),
    );
  }

  Widget buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Style.primaryColor,
          ),
          onPressed: null,
          child: Row(
            children: [
              Text(
                "${LocaleKeys.priceGun.tr()} : ",
                style: context.theme.titleMedium!.copyWith(
                  color: Style.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: Style.defaultPaddingSize / 4),
                child: Image.asset(
                  "assets/images/creditIcon.webp",
                  color: Style.primaryColor,
                ),
              ),
              widget.gunApiModel.shopData == null
                  ? Text(
                      LocaleKeys.free.tr(),
                      style: context.theme.titleMedium!.copyWith(
                        color: Style.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      " ${widget.gunApiModel.shopData?.cost ?? StringConstants.noData}",
                      style: context.theme.titleMedium!.copyWith(
                        color: Style.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Style.primaryColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GunSkinPage(
                  skinsUid: widget.gunApiModel,
                ),
              ),
            );
          },
          child: Text(
            LocaleKeys.allSkin.tr(),
            style: context.theme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Style.whiteColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget linearIndicator(int index, String? data, double percent) {
    return LinearPercentIndicator(
      barRadius: Radius.circular(Style.defaultRadiusSize),
      animation: true,
      lineHeight: 52.h,
      padding: EdgeInsets.zero,
      animationDuration: 2000,
      percent: percent,
      center: Text(
        data?.split('.')[0] ?? StringConstants.noData,
        style: context.theme.bodySmall!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      progressColor: Style.primaryColor,
    );
  }

  Widget indicatorItem(int index, String title, String? data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.theme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          data?.split('.')[0] ?? StringConstants.noData,
          style: context.theme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
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
          style: context.theme.titleMedium!.copyWith(
            color: Style.darkTextColor,
          ),
        ),
        Text(
          data ?? StringConstants.noData,
          style: context.theme.titleMedium!.copyWith(
            color: Style.primaryColor,
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
          style: context.theme.titleLarge,
        ),
      ],
    );
  }
}
