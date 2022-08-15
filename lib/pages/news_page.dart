import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/data/api_client.dart';
import 'package:valoinfos/model/news_api_model.dart';
import 'package:valoinfos/utilities/style.dart';

import '../provider/locale_provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ApiClient apiClient = ApiClient();
  List<Data> data = [];
  // var languageCode;

  @override
  void initState() {
    var languageCode =
        Provider.of<LanguageProvider>(context, listen: false).locale;

    apiClient.getNews(languageCode).then(
          (value) => {
            setState(() {
              data = value!;
            })
          },
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("news".tr()),
      ),
      body: newsBody(),
    );
  }

  Widget newsBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: defPagePadd,
        child: Column(
          children: [
            newsList(),
          ],
        ),
      ),
    );
  }

  Widget newsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 48.h),
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
        vertical: 40.h,
        horizontal: 48.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Style().iconColor.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(defRadius),
          bottomRight: Radius.circular(defRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data[index].displayName.toString(),
            style: TextStyle(
              fontSize: 48.sp,
              color: Style().textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            data[index].extraDescription?.toString() ??
                data[index].description.toString(),
            style: TextStyle(
              color: Style().textColor,
              fontSize: 40.sp,
            ),
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
          color: Style().iconColor.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defRadius),
          topRight: Radius.circular(defRadius),
        ),
      ),
      child: data[index].verticalPromoImage.toString() == "null"
          ? Image.asset("assets/char/no.png")
          : Image.network(
              data[index].verticalPromoImage.toString(),
              fit: BoxFit.cover,
            ),
    );
  }
}
