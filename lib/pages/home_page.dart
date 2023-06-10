import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:valoinfos/constants/enums.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/handle_excepiton.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/model/char_api_model.dart';
import 'package:valoinfos/translations/locale_keys.g.dart';
import 'package:valoinfos/viewmodels/data_view_model.dart';
import 'package:valoinfos/widgets/custom_appbar.dart';
import 'package:valoinfos/widgets/packages/cache_image.dart';
import 'package:valoinfos/widgets/packages/lottie/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.rateMyApp,
  }) : super(key: key);

  final RateMyApp rateMyApp;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataViewModel? _dataViewModel;
  List<DataChar>? _getChars;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getFutures();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Random randChar = Random();
    int rand = randChar.nextInt(20);
    _dataViewModel ??= Provider.of<DataViewModel>(context, listen: false);
    String title = 'Valorant Info';
    String discoverTitle = 'Keşfet';
    String colorOne = "0xff${_getChars?[rand].backgroundGradientColors![0].substring(0, 6) ?? 0xff}";
    FlutterNativeSplash.remove();
    return Scaffold(
      appBar: appBar(context, colorOne),
      body: body(title, _getChars?[rand].fullPortrait, discoverTitle, context, rand, colorOne),
    );
  }

  PreferredSizeWidget appBar(BuildContext context, String colorOne) {
    return CustomAppBar(
      leading: Padding(
        padding: EdgeInsets.all(Style.defaultPaddingSize * .85),
        child: InkWell(
          onTap: () {
            widget.rateMyApp.showRateDialog(
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
              onDismissed: () => widget.rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(Style.defaultPaddingSize * 0.25),
            child: SvgPicture.asset(
              IconPath.pencil.name.iconPath,
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: Style.defaultPaddingSize),
          child: SvgPicture.asset(
            LogoPath.v1.name.logoPath,
            color: Color(int.parse(colorOne)),
            height: 50.h,
          ),
        ),
      ],
    );
  }

  List<Widget> _actionsBuilder(BuildContext context, double? stars) {
    if (stars == null) {
      return [
        _buildCancelButton(),
      ];
    } else {
      return [
        _buildCancelButton(),
        _buildOkButton(),
      ];
    }
  }

  Widget _buildCancelButton() => RateMyAppRateButton(widget.rateMyApp, text: 'OK');

  Widget _buildOkButton() => RateMyAppNoButton(widget.rateMyApp, text: 'CANCEL');

  Widget body(String title, String? image, String discoverTitle, BuildContext context, int rand, String color) {
    return SingleChildScrollView(
      child: Padding(
        padding: Style.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: Style.defaultPaddingSize * 0.5, bottom: Style.defaultPaddingSize),
              child: headTitle(title, Color(int.parse(color))),
            ),
            desc(LocaleKeys.welcome.tr()),
            Stack(
              children: [
                imageBack(_getChars?[rand].background, Color(int.parse(color))),
                image == null ? const LoadingWidget() : imageLearn(image),
              ],
            ),
            //discovers(discoverTitle, context),
          ],
        ),
      ),
    );
  }

  Widget imageLearn(String? image) {
    return Center(
      child: CacheImage(
        image: image,
        fit: BoxFit.cover,
        height: 1150.h,
      ),
    );
  }

  Widget imageBack(String? image, Color? color) {
    return Center(
      child: CacheImage(
        image: image,
        fit: BoxFit.cover,
        height: 1150.h,
        color: color,
      ),
    );
  }

  Widget desc(String description) {
    return Text(
      description,
      style: context.theme.titleMedium,
    );
  }

  Widget headTitle(String title, Color? color) {
    return Text(
      title,
      style: context.theme.headlineMedium!.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Future<void> _getFutures() async {
    try {
      await _dataViewModel!.getChars(context.locale).then(
            (value) => _getChars = value,
          );
      setState(() {});
    } catch (e) {
      HandleException.handle(context: context);
    }
  }
}
