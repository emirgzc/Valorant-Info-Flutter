import 'package:bordered_text/bordered_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/constants/enums.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/handle_excepiton.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/model/content_tiers_model.dart';
import 'package:valoinfos/model/gun_api_model.dart';
import 'package:valoinfos/model/gun_skin_api_model.dart';
import 'package:valoinfos/utilities/strings.dart';
import 'package:valoinfos/viewmodels/data_view_model.dart';
import 'package:valoinfos/widgets/packages/cache_image.dart';
import 'package:valoinfos/widgets/packages/lottie/loading_widget.dart';

class GunSkinDetailPage extends StatefulWidget {
  const GunSkinDetailPage({Key? key, required this.skinUidd}) : super(key: key);
  final Skins? skinUidd;

  @override
  State<GunSkinDetailPage> createState() => _GunSkinDetailPageState();
}

class _GunSkinDetailPageState extends State<GunSkinDetailPage> {
  DataGunSkin? _getSkinForGun;
  DataViewModel? _dataViewModel;
  DataContentTiers? _dataContentTiers;
  int indexA = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getColorsSkin();
      _getFuture();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dataViewModel ??= Provider.of<DataViewModel>(context, listen: false);
    return Scaffold(
      body: _getSkinForGun == null ? const LoadingWidget() : body(context, _getSkinForGun),
    );
  }

  Widget body(BuildContext context, DataGunSkin? datas) {
    Color color = Color(
      int.parse(
        "0xff${_dataContentTiers?.highlightColor ?? 0xffc}",
      ),
    );
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 0.65.sh,
            decoration: gunDecoration(),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: Style.pagePadding * 0.5,
            child: gunSkinDetailBody(context, datas, _dataContentTiers?.displayIcon),
          ),
        ),
        Positioned(
          top: 180.h,
          left: 30.w,
          child: backButton(context),
        ),
        Positioned(
          top: 200.h,
          right: 30.w,
          child: AnimatedCrossFade(
            firstChild: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/videoPage',
                  arguments: datas?.chromas![indexA].streamedVideo ?? "",
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: Style.defaultPaddingSize),
                padding: EdgeInsets.all(Style.defaultPaddingSize * 0.45),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(Style.defaultRadiusSize),
                ),
                child: SvgPicture.asset(
                  IconPath.play.name.iconPath,
                  color: Style.whiteColor,
                ),
              ),
            ),
            secondChild: const SizedBox.shrink(),
            crossFadeState: indexA != 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: Style.defaultMilisecond),
          ),
        ),
      ],
    );
  }

  Widget backButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: SvgPicture.asset(
        IconPath.back.name.iconPath,
        height: 62.h,
      ),
    );
  }

  Decoration gunDecoration() {
    Color color = Color(
      int.parse(
        "0xff${_dataContentTiers?.highlightColor ?? 0xffc}",
      ),
    );
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withOpacity(0.8),
          color.withOpacity(0.5),
          color.withOpacity(0.3),
          color.withOpacity(0.2),
          color.withOpacity(0.01),
        ],
      ),
    );
  }

  Widget gunSkinDetailBody(BuildContext context, DataGunSkin? data, String? icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: Style.defaultPaddingSize * 2.5,
            top: Style.defaultPaddingSize * 8,
            left: Style.defaultPaddingSize,
            right: Style.defaultPaddingSize,
          ),
          child: Center(
            child: CacheImage(
              image: data?.chromas?[indexA].displayIcon ?? (data?.chromas?[indexA].fullRender),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: Style.defaultPaddingSize * 1.6,
            horizontal: Style.defaultPaddingSize,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: Style.defaultPaddingSize / 4),
                child: CacheImage(
                  image: icon,
                  fit: BoxFit.contain,
                  height: 80.h,
                ),
              ),
              Expanded(
                child: gunTitle(data),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Style.defaultPaddingSize, vertical: Style.defaultPaddingSize / 2),
          child: Wrap(
            spacing: 30.w,
            alignment: WrapAlignment.start,
            children: [
              ...List.generate(
                data?.chromas?.length ?? 0,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        // image = data?.chromas![index].displayIcon;
                        indexA = index;
                      });
                    },
                    child: swatchCard(data, index),
                  );
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: Style.defaultPaddingSize),
          child: levelList(data),
        ),
        SizedBox(height: 100.h),
      ],
    );
  }

  Widget levelList(DataGunSkin? data) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: Style.defaultPaddingSize),
      itemCount: data?.levels?.length ?? 0,
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (context, index) {
        String levelTitle = 'Level ${index + 1}';
        return levelCard(data, index, levelTitle, context);
      },
    );
  }

  Widget levelCard(DataGunSkin? data, int index, String levelTitle, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/videoPage',
          arguments: data?.levels![index].streamedVideo ?? "",
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Style.defaultPaddingSize * 0.7,
          vertical: Style.defaultPaddingSize * 0.4,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Style.defaultPaddingSize / 3),
          color: Style.darkTextColor.withOpacity(0.12),
          child: Padding(
            padding: EdgeInsets.only(left: Style.defaultPaddingSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data?.levels?[index].displayName ?? StringData.noData,
                        textAlign: TextAlign.start,
                        style: context.theme.bodyLarge!.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        levelTitle,
                        style: context.theme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Style.defaultPaddingSize * 0.6),
                  padding: EdgeInsets.all(Style.defaultPaddingSize * 0.6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Style.darkTextColor.withOpacity(0.3),
                    ),
                    color: Style.textColor,
                  ),
                  child: SvgPicture.asset(
                    IconPath.play.name.iconPath,
                    color: Style.darkTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget swatchCard(DataGunSkin? data, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Style.defaultPaddingSize * 0.2),
      height: 200.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: Style.darkTextColor.withOpacity(0.1),
      ),
      child: CacheImage(
        image: data?.chromas?[index].swatch ?? (data?.chromas?[index].fullRender),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget gunTitle(DataGunSkin? data) {
    return BorderedText(
      strokeWidth: 1.0,
      strokeColor: Style.primaryColor.withOpacity(0.7),
      child: Text(
        data?.displayName ?? StringData.noData,
        style: TextStyle(
          color: Style.primaryColor,
          fontSize: 72.sp,
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

  Future<void> _getFuture() async {
    try {
      await _dataViewModel!.getSkinForGun(widget.skinUidd?.uuid ?? '', context.locale).then(
            (value) => _getSkinForGun = value,
          );
      setState(() {});
    } catch (e) {
      HandleException.handle(context: context);
    }
  }

  Future<void> _getColorsSkin() async {
    try {
      await _dataViewModel!.getContentTiers(widget.skinUidd?.contentTierUuid ?? '', context.locale).then(
            (value) => _dataContentTiers = value,
          );
      setState(() {});
    } catch (e) {
      HandleException.handle(context: context);
    }
  }
}
