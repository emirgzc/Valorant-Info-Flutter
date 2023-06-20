import 'package:bordered_text/bordered_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/product/constants/string_constants.dart';
import 'package:valoinfos/product/utility/handle_excepiton.dart';
import 'package:valoinfos/product/utility/style.dart';
import 'package:valoinfos/product/enums/page_name_constants.dart';
import 'package:valoinfos/product/models/char_api_model.dart';
import 'package:valoinfos/product/utility/translations/locale_keys.g.dart';
import 'package:valoinfos/product/viewmodels/data_view_model.dart';
import 'package:valoinfos/product/widgets/custom_appbar.dart';
import 'package:valoinfos/product/widgets/packages/cache_image.dart';
import 'package:valoinfos/product/widgets/packages/lottie/loading_widget.dart';

class CharPage extends StatefulWidget {
  const CharPage({Key? key}) : super(key: key);

  @override
  State<CharPage> createState() => _CharPageState();
}

class _CharPageState extends State<CharPage> {
  DataViewModel? _dataViewModel;
  List<DataChar>? _getChars;
  double spacing = 10;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getFutures();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dataViewModel ??= Provider.of<DataViewModel>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(LocaleKeys.characters.tr()),
      ),
      body: charBody(),
    );
  }

  Widget charBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: Style.pagePadding,
        child: _getChars != null ? listChar(_getChars) : const LoadingWidget(),
      ),
    );
  }

  Widget listChar(List<DataChar>? datas) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: datas?.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Style.defautlCrossAxisCount,
        childAspectRatio: 0.6,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      itemBuilder: (context, index) {
        return charCard(context, index, datas);
      },
    );
  }

  Widget charCard(BuildContext context, int index, List<DataChar>? datas) {
    String colorOne = "0xff${datas?[index].backgroundGradientColors![0].substring(0, 6) ?? 0xff}";
    String colorThree = "0xff${datas?[index].backgroundGradientColors![2].substring(0, 6) ?? 0xff}";
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          PageNameConstants.charDetailPage.pageName,
          arguments: datas?[index].uuid ?? '',
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Color(int.parse(colorOne))),
            padding: EdgeInsets.symmetric(vertical: Style.defaultPaddingSize / 2),
            //margin: EdgeInsets.only(bottom: 40.h),
            width: double.infinity,
            child: Stack(
              children: [
                //nameCharTitle(index, datas),
                Positioned(
                  top: 0,
                  right: -20,
                  child: backgroundImage(datas, index),
                ),
                imageChar(index, datas),
                Positioned(
                  top: 20,
                  left: 30.w,
                  child: charItems(datas, index, colorThree),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget charItems(List<DataChar>? datas, int index, String colorThree) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: BorderedText(
            strokeWidth: 1.0,
            strokeColor: Style.whiteColor,
            child: Text(
              datas?[index].displayName ?? StringConstants.noData,
              style: TextStyle(
                color: Style.whiteColor,
                fontSize: 72.sp,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Style.darkTextColor.withOpacity(0.1),
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: Text(
                datas?[index].role?.displayName ?? StringConstants.noData,
                style: TextStyle(
                  color: Color(int.parse(colorThree)),
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Style.defaultPaddingSize / 4),
              child: CacheImage(
                fit: BoxFit.cover,
                image: datas?[index].role?.displayIcon ?? StringConstants.noData,
                height: 40.h,
                color: Color(int.parse(colorThree)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget backgroundImage(List<DataChar>? datas, int index) {
    return CacheImage(
      fit: BoxFit.cover,
      image: datas?[index].background,
      height: 500.h,
    );
  }

  Widget imageChar(int index, List<DataChar>? datas) {
    return Positioned(
      bottom: 0,
      left: -50.w,
      child: Hero(
        tag: datas?[index].uuid ?? '',
        child: CacheImage(
          fit: BoxFit.cover,
          height: 570.h,
          image: datas?[index].bustPortrait,
        ),
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
