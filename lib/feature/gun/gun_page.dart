import 'package:bordered_text/bordered_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/product/constants/string_constants.dart';
import 'package:valoinfos/product/utility/extension.dart';
import 'package:valoinfos/product/utility/handle_excepiton.dart';
import 'package:valoinfos/product/utility/style.dart';
import 'package:valoinfos/product/enums/page_name_constants.dart';
import 'package:valoinfos/product/models/gun_api_model.dart';
import 'package:valoinfos/product/utility/translations/locale_keys.g.dart';
import 'package:valoinfos/product/viewmodels/data_view_model.dart';
import 'package:valoinfos/product/widgets/custom_appbar.dart';
import 'package:valoinfos/product/widgets/packages/cache_image.dart';
import 'package:valoinfos/product/widgets/packages/lottie/loading_widget.dart';

class GunPage extends StatefulWidget {
  const GunPage({Key? key}) : super(key: key);

  @override
  State<GunPage> createState() => _GunPageState();
}

class _GunPageState extends State<GunPage> {
  DataViewModel? _dataViewModel;
  List<DataGun>? _getGuns;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getFutures();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(LocaleKeys.guns.tr()),
      ),
      body: gunPageBody(context),
    );
  }

  Widget gunPageBody(BuildContext context) {
    _dataViewModel ??= Provider.of<DataViewModel>(context, listen: false);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: Style.pagePadding,
        child: _getGuns != null ? gunList(_getGuns) : const LoadingWidget(),
      ),
    );
  }

  Widget gunList(List<DataGun>? datas) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: datas?.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Style.defautlCrossAxisCount,
        mainAxisSpacing: 40.h,
        crossAxisSpacing: 50.w,
      ),
      itemBuilder: (context, index) {
        return gunCard(context, datas, index);
      },
    );
  }

  Widget gunCard(BuildContext context, List<DataGun>? datas, int index) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        PageNameConstants.gunDetailPage.pageName,
        arguments: datas?[index],
      ),
      child: Stack(
        children: [
          gunImage(datas, index),
          gunNameTitle(datas, index),
          skinLengthTitle(datas, index),
        ],
      ),
    );
  }

  Widget gunImage(List<DataGun>? datas, int index) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 40.w,
        vertical: 80.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Style.darkTextColor.withOpacity(0.27),
        ),
        color: Style.darkTextColor.withOpacity(0.17),
      ),
      child: Hero(
        tag: datas?[index].uuid ?? StringConstants.noData,
        child: CacheImage(
          image: datas?[index].displayIcon,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget gunNameTitle(List<DataGun>? datas, int index) {
    return Positioned(
      top: 0,
      child: Padding(
        padding: EdgeInsets.only(
          left: 30.w,
          top: 30.h,
        ),
        child: BorderedText(
          strokeWidth: 1.0,
          strokeColor: Style.darkTextColor.withOpacity(0.9),
          child: Text(
            "${datas?[index].displayName ?? StringConstants.noData}.",
            style: context.theme.titleMedium!.copyWith(
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget skinLengthTitle(List<DataGun>? datas, int index) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: Style.defaultPaddingSize * 0.6,
          right: Style.defaultPaddingSize * 0.6,
        ),
        child: BorderedText(
          strokeWidth: 1.0,
          strokeColor: Style.darkTextColor.withOpacity(0.8),
          child: Text(
            "${datas?[index].skins?.length ?? StringConstants.noData} ${LocaleKeys.skinsLenght.tr()}",
            style: context.theme.bodySmall!.copyWith(letterSpacing: 1.1),
          ),
        ),
      ),
    );
  }

  Future<void> _getFutures() async {
    try {
      await _dataViewModel!.getGuns(context.locale).then(
            (value) => _getGuns = value,
          );
      setState(() {});
    } catch (e) {
      HandleException.handle(context: context);
    }
  }
}
