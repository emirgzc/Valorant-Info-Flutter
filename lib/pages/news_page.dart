import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/handle_excepiton.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/model/news_api_model.dart';
import 'package:valoinfos/translations/locale_keys.g.dart';
import 'package:valoinfos/utilities/strings.dart';
import 'package:valoinfos/viewmodels/data_view_model.dart';
import 'package:valoinfos/widgets/custom_appbar.dart';
import 'package:valoinfos/widgets/packages/cache_image.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  DataViewModel? _dataViewModel;
  List<DataNews>? _data;

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
        title: Text(LocaleKeys.news.tr()),
      ),
      body: newsBody(),
    );
  }

  Widget newsBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: Style.pagePadding,
        child: newsList(),
      ),
    );
  }

  Widget newsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: (_data?.length ?? 0) > 20 ? 20 : (_data?.length ?? 0),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: Style.defaultPaddingSize),
          child: Column(
            children: [
              imageNews(index),
              textCardNews(index),
            ],
          ),
        );
      },
    );
  }

  Widget textCardNews(int index) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Style.defaultPaddingSize * 0.5,
        horizontal: Style.defaultPaddingSize * 0.7,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Style.darkTextColor.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Style.defaultRadiusSize),
          bottomRight: Radius.circular(Style.defaultRadiusSize),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _data?[index].displayName ?? StringData.noData,
            style: context.theme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            _data?[index].extraDescription ?? (_data?[index].description ?? StringData.noData),
            style: context.theme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget imageNews(int index) {
    return Container(
      height: 430.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Style.darkTextColor.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Style.defaultRadiusSize),
          topRight: Radius.circular(Style.defaultRadiusSize),
        ),
      ),
      child: InkWell(
        onTap: () => showAlertDialog(context, _data?[index].displayIcon),
        child: CacheImage(
          image: _data?[index].displayIcon,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, String? image) {
    showDialog(
      barrierColor: Style.blackColor.withOpacity(0.9),
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: Style.defaultPaddingSize),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Style.defaultRadiusSize),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: CacheImage(
            image: image,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }

  Future<void> _getFutures() async {
    try {
      await _dataViewModel!.getNews(context.locale).then(
            (value) => _data = value,
          );
      setState(() {});
    } catch (e) {
      HandleException.handle(context: context);
    }
  }
}
