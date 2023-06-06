import 'package:bordered_text/bordered_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/constants/enums.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/model/char_one_api_model.dart';
import 'package:valoinfos/pages/sound.dart';
import 'package:valoinfos/utilities/strings.dart';
import 'package:valoinfos/viewmodels/data_view_model.dart';
import 'package:valoinfos/widgets/custom_appbar.dart';
import 'package:valoinfos/widgets/packages/cache_image.dart';
import 'package:valoinfos/widgets/packages/lottie/loading_widget.dart';

class CharDetailPage extends StatefulWidget {
  const CharDetailPage({Key? key, required this.charUidd}) : super(key: key);
  final String charUidd;

  @override
  State<CharDetailPage> createState() => _CharDetailPageState();
}

class _CharDetailPageState extends State<CharDetailPage> {
  DataViewModel? _dataViewModel;
  DataCharOne? _dataCharOne;
  int indexAbi = 0;
  DataCharOne? _getCharDetail;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getFutures();
      _getColors();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String colorOne = "0xff${_dataCharOne?.backgroundGradientColors![0].substring(0, 6) ?? 0xff}";
    String colorTwo = "0xff${_dataCharOne?.backgroundGradientColors![1].substring(0, 6) ?? 0xff}";
    String colorThree = "0xff${_dataCharOne?.backgroundGradientColors![2].substring(0, 6) ?? 0xff}";

    double height = MediaQuery.of(context).size.height;
    _dataViewModel ??= Provider.of<DataViewModel>(context, listen: false);

    return Scaffold(
      appBar: getCharDetAppBar(context, colorOne, colorTwo),
      body: _body(height, colorOne, colorTwo, colorThree),
    );
  }

  Widget _body(double height, String colorOne, String colorTwo, String colorThree) {
    return SingleChildScrollView(
      child: _getCharDetail == null
          ? const LoadingWidget()
          : _charBody(
              height,
              colorOne,
              colorTwo,
              colorThree,
              _getCharDetail,
            ),
    );
  }

  Widget _charBody(double height, String colorOne, String colorTwo, String colorThree, DataCharOne? datas) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: _colorGradient(colorOne, colorTwo),
      ),
      child: Padding(
        padding: Style.pagePadding,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 0,
                  right: -30.w,
                  child: datas?.background == null ? const SizedBox.shrink() : _backgroundImage(datas, colorTwo),
                ),
                Positioned(
                  top: 0,
                  child: _charName(datas, colorTwo),
                ),
                Hero(
                  tag: datas?.uuid??'',
                  child: CacheImage(
                    image: datas?.bustPortrait,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
            _roleChar(datas, colorThree),
            _descChar(datas, colorThree),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Style.defaultPaddingSize * 1.5),
              child: _abilitiesList(datas, colorTwo, colorThree),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Style.defaultPaddingSize / 2),
              child: _abilitiesName(datas, colorThree),
            ),
            _abilitiesDesc(datas, colorThree),
            SizedBox(
              height: 650.h,
            )
          ],
        ),
      ),
    );
  }

  Widget _abilitiesDesc(DataCharOne? datas, String color) {
    return Text(
      datas?.abilities?[indexAbi].description ?? StringData.noData,
      style: context.theme.bodyMedium!.copyWith(
        color: Color(
          int.parse(color),
        ),
      ),
    );
  }

  Widget _abilitiesName(DataCharOne? datas, String color) {
    return Text(
      datas?.abilities?[indexAbi].displayName?.toUpperCase() ?? StringData.noData,
      textAlign: TextAlign.center,
      style: context.theme.titleLarge!.copyWith(
        color: Color(
          int.parse(color),
        ),
      ),
    );
  }

  Widget _abilitiesList(DataCharOne? datas, String colorTwo, String colorThree) {
    return Wrap(
      spacing: 30.r,
      runSpacing: 10,
      alignment: WrapAlignment.start,
      children: [
        ...List.generate(
          datas?.abilities?.length ?? 0,
          (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  indexAbi = index;
                });
              },
              child: abilitiesCard(index, colorTwo, colorThree, datas),
            );
          },
        ),
      ],
    );
  }

  Widget abilitiesCard(int index, String colorTwo, String colorThree, DataCharOne? datas) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 32.w,
        vertical: 40.h,
      ),
      height: 180.h,
      width: 200.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: index == indexAbi
              ? Color(
                  int.parse(colorTwo),
                )
              : Color(
                  int.parse(colorThree),
                ).withOpacity(0.6),
        ),
        color: index == indexAbi
            ? Color(
                int.parse(colorTwo),
              )
            : Color(
                int.parse(colorTwo),
              ).withOpacity(0.3),
        borderRadius: index == indexAbi ? BorderRadius.circular(Style.defaultRadiusSize * 2) : BorderRadius.zero,
      ),
      child: CacheImage(
        image: datas?.abilities?[index].displayIcon,
        fit: BoxFit.contain,
        color: index != indexAbi
            ? Color(
                int.parse(
                  "0xff${datas?.backgroundGradientColors![3].substring(0, 6)}",
                ),
              )
            : Style.whiteColor,
      ),
    );
  }

  Widget _descChar(DataCharOne? datas, String colorThree) {
    return Text(
      datas?.description ?? StringData.noData,
      style: context.theme.bodyMedium!.copyWith(
        color: Color(
          int.parse(colorThree),
        ),
      ),
    );
  }

  Widget _roleChar(DataCharOne? datas, String colorThree) {
    return Padding(
      padding: EdgeInsets.only(
        top: Style.defaultPaddingSize * 1.5,
        bottom: Style.defaultPaddingSize / 2,
      ),
      child: Text(
        datas?.role?.displayName?.toUpperCase() ?? StringData.noData,
        style: context.theme.headlineSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: Color(int.parse(colorThree)),
        ),
      ),
    );
  }

  Widget _charName(DataCharOne? datas, String colorTwo) {
    return RotatedBox(
      quarterTurns: 1,
      child: BorderedText(
        strokeWidth: 4,
        strokeColor: Color(int.parse(colorTwo)),
        child: Text(
          datas?.displayName?.toUpperCase() ?? StringData.noData,
          style: TextStyle(
            letterSpacing: 4,
            color: Color(int.parse(colorTwo)),
            fontSize: 116.sp,
            shadows: [
              Shadow(
                blurRadius: 5,
                color: Color(
                  int.parse(colorTwo),
                ).withOpacity(0.3),
                offset: const Offset(5, 7),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgroundImage(DataCharOne? datas, String colorTwo) {
    return CacheImage(
      image: datas?.background ?? StringData.noData,
      fit: BoxFit.contain,
      height: 800.h,
      color: Color(int.parse(colorTwo)),
    );
  }

  LinearGradient _colorGradient(String colorOne, String colorTwo) {
    return LinearGradient(
      colors: [
        Color(int.parse(colorOne)),
        Color(int.parse(colorTwo)),
      ],
    );
  }

  PreferredSizeWidget getCharDetAppBar(BuildContext context, String colorOne, String colorTwo) {
    return CustomAppBar(
      flexibleSpace: _appBarColor(colorOne, colorTwo),
      foregroundColor: Color(int.parse(colorTwo)),
      actions: [_soundButton(context)],
    );
  }

  Widget _appBarColor(String colorOne, String colorTwo) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(int.parse(colorOne)),
            Color(int.parse(colorTwo)),
          ],
        ),
      ),
    );
  }

  Widget _soundButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SoundPage(
                sound: _dataCharOne?.voiceLine?.mediaList?[0].wave ?? "",
                imageBack: _dataCharOne?.bustPortrait ?? "",
                imageBack2: _dataCharOne?.background ?? "",
                color: _dataCharOne?.backgroundGradientColors?[0] ?? "",
              ),
            ),
          );
        },
        child: SvgPicture.asset(
          IconPath.play.name.iconPath,
          color: Style.iconColor,
          height: Style.defaultPaddingSize * 1.2,
        ),
      ),
    );
  }

  Future<void> _getFutures() async {
    try {
      await _dataViewModel!.getDetailForChar(widget.charUidd, context.locale).then(
            (value) => _getCharDetail = value,
          );
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getColors() async {
    try {
      await _dataViewModel!.getDetailForChar(widget.charUidd, context.locale).then(
            (value) => _dataCharOne = value,
          );
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
