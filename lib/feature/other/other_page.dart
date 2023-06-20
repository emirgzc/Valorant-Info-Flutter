import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/product/utilities/extension.dart';
import 'package:valoinfos/product/utilities/handle_excepiton.dart';
import 'package:valoinfos/product/utilities/style.dart';
import 'package:valoinfos/model/Competitivetiers_model.dart';
import 'package:valoinfos/product/model/map_api_model.dart';
import 'package:valoinfos/product/model/news_api_model.dart';
import 'package:valoinfos/product/utilities/translations/locale_keys.g.dart';
import 'package:valoinfos/product/viewmodels/data_view_model.dart';
import 'package:valoinfos/product/widgets/custom_appbar.dart';
import 'package:valoinfos/product/widgets/packages/cache_image.dart';
import 'package:valoinfos/product/widgets/packages/lottie/loading_widget.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  DataViewModel? _dataViewModel;
  List<DataMap>? _maps;
  List<DataNews>? _news;
  List<Datum>? _comp;

  Random r = Random();

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

    int randNum = r.nextInt(10);

    _comp?[0].tiers?.removeWhere(
          (element) => element.largeIcon == null,
        );

    List<Map<String, dynamic>> allItem = [
      {
        'title': LocaleKeys.maps.tr(),
        'image': _maps?[randNum].splash,
        'onTap': '/mapsPage',
      },
      {
        'title': LocaleKeys.news.tr(),
        'image': _news?[randNum].displayIcon,
        'onTap': '/newsPage',
      },
      {
        'title': LocaleKeys.comp.tr(),
        'image': _comp?[0].tiers?[randNum].largeIcon,
        'onTap': '/compPage',
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(LocaleKeys.diger.tr()),
      ),
      body: body(allItem),
    );
  }

  Widget body(List<Map<String, dynamic>> allItem) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: Style.pagePadding,
        child: allItem[0]['image'] == null ? const LoadingWidget() : lisOther(allItem),
      ),
    );
  }

  Widget lisOther(List<Map<String, dynamic>> allItem) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: allItem.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: Style.defaultPaddingSize),
          child: _categoryCard(
            allItem[index]['image'],
            allItem[index]['title'],
            allItem[index]['onTap'],
          ),
        );
      },
    );
  }

  Widget _categoryCard(String? image, String text, String onTap) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, onTap),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Style.defaultRadiusSize),
        child: Stack(
          children: [
            imageOther(image, text),
            Positioned(
              bottom: 0,
              left: 0,
              child: title(text),
            ),
          ],
        ),
      ),
    );
  }

  Widget title(String text) {
    return Container(
      padding: EdgeInsets.all(Style.defaultPaddingSize / 2),
      color: Style.blackColor.withOpacity(0.7),
      child: Text(
        text,
        style: context.theme.titleMedium!.copyWith(
          color: Style.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget imageOther(String? image, String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Style.defaultRadiusSize),
      child: SizedBox(
        width: double.infinity,
        child: CacheImage(
          image: image,
          fit: text == LocaleKeys.comp.tr() ? BoxFit.contain : BoxFit.cover,
          height: 450.h,
        ),
      ),
    );
  }

  Future<void> _getFutures() async {
    try {
      await _dataViewModel!.getMaps(context.locale).then(
            (value) => _maps = value,
          );
      await _dataViewModel!.getNews(context.locale).then(
            (value) => _news = value,
          );
      await _dataViewModel!.getComp(context.locale).then(
            (value) => _comp = value,
          );
      setState(() {});
    } catch (e) {
      HandleException.handle(context: context);
    }
  }
}
