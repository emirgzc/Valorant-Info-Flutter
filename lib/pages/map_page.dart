import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/constants/enums.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/model/map_api_model.dart';
import 'package:valoinfos/translations/locale_keys.g.dart';
import 'package:valoinfos/utilities/strings.dart';
import 'package:valoinfos/viewmodels/data_view_model.dart';
import 'package:valoinfos/widgets/custom_appbar.dart';
import 'package:valoinfos/widgets/packages/cache_image.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  DataViewModel? _dataViewModel;
  List<DataMap>? _getMaps;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getFuture();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dataViewModel ??= Provider.of<DataViewModel>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(title: Text(LocaleKeys.maps.tr())),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: Style.pagePadding,
        child: mapList(_getMaps),
      ),
    );
  }

  Widget mapList(List<DataMap>? datas) {
    return ListView.builder(
      itemCount: datas?.length ?? 0,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return mapCard(context, datas, index);
      },
    );
  }

  Widget mapCard(BuildContext context, List<DataMap>? datas, int index) {
    return GestureDetector(
      onTap: () {
        showAlertDialog(context, datas?[index].displayIcon);
      },
      child: Stack(
        children: [
          mapImage(datas, index),
          Positioned(
            bottom: 0,
            left: 0,
            child: mapItem(datas, index),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: detailButton(),
          ),
        ],
      ),
    );
  }

  Widget mapImage(List<DataMap>? datas, int index) {
    return Container(
      height: 360.h,
      margin: EdgeInsets.only(bottom: Style.defaultPaddingSize * 1.05),
      child: CacheImage(
        image: datas?[index].listViewIcon,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget detailButton() {
    return Padding(
      padding: EdgeInsets.only(
        top: Style.defaultPaddingSize / 2,
        right: Style.defaultPaddingSize / 2,
      ),
      child: Container(
        padding: EdgeInsets.all(Style.defaultPaddingSize * 0.3),
        color: Style.iconColor.withOpacity(0.8),
        child: SvgPicture.asset(
          IconPath.info.name.iconPath,
          color: Style.darkTextColor,
        ),
      ),
    );
  }

  Widget mapItem(List<DataMap>? datas, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: Style.defaultPaddingSize * 1.05),
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 60.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Style.defaultRadiusSize),
        ),
        color: Style.iconColor.withOpacity(0.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            datas?[index].displayName ?? StringData.noData,
            style: context.theme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            datas?[index].coordinates ?? StringData.noData,
            style: context.theme.titleSmall!.copyWith(
              fontWeight: FontWeight.w400,
              color: Style.darkTextColor,
            ),
          ),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context, String? displayIconMap) {
    showDialog(
      barrierColor: Style.blackColor.withOpacity(0.9),
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: CacheImage(
            image: displayIconMap,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }

  Future<void> _getFuture() async {
    try {
      await _dataViewModel!.getMaps(context.locale).then(
            (value) => _getMaps = value,
          );
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
