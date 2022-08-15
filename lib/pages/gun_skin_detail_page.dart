import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/data/api_client.dart';
import 'package:valoinfos/model/gun_skin_api_model.dart';
import 'package:valoinfos/pages/video.dart';
import 'package:valoinfos/utilities/style.dart';

import '../provider/locale_provider.dart';

class GunSkinDetailPage extends StatefulWidget {
  const GunSkinDetailPage({Key? key, required this.skinUidd}) : super(key: key);
  final String skinUidd;

  @override
  State<GunSkinDetailPage> createState() => _GunSkinDetailPageState();
}

class _GunSkinDetailPageState extends State<GunSkinDetailPage> {
  ApiClient apiClient = ApiClient();
  // Data? data;
  String? image;
  int indexA = 0;
  // var languageCode;

  @override
  void initState() {
    // languageCode = Provider.of<LanguageProvider>(context).locale;
    // apiClient.getSkinForGun(widget.skinUidd, languageCode).then(
    //       (value) => {
    //         setState(() {
    //           data = value!;
    //         })
    //       },
    //     );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var languageCode =
        Provider.of<LanguageProvider>(context, listen: false).locale;

    return Scaffold(
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: ApiClient().getSkinForGun(widget.skinUidd, languageCode),
          builder: (context, snapshot) {
            // var datas = snapshot.data as Data?;
            if (snapshot.hasData && snapshot.data != null) {
              var datas = snapshot.data as Data?;
              image = datas?.chromas![indexA].displayIcon;
              return gunSkinDetailBody(context, datas);
            } else {
              return buildLastProcessCardEffect(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 500.h,
                      padding: EdgeInsets.symmetric(
                        vertical: 100.h,
                        horizontal: 60.w,
                      ),
                      width: double.infinity,
                      color: Style().secondaryColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 60.h, horizontal: 40.w),
                      child: Row(
                        children: [
                          Text(
                            "gunsColor".tr(),
                            style: TextStyle(
                              fontSize: 70.sp,
                              color: Style().textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 24.h),
                      child: Wrap(
                        spacing: 30.w,
                        alignment: WrapAlignment.start,
                        children: [
                          ...List.generate(
                            4,
                            (index) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                height: 200.h,
                                width: 220.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Style().textColor,
                                  ),
                                  color: Style().textColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    ...List.generate(
                      4,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.w, vertical: 16.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_circle_outline,
                                      color: Style().iconColor,
                                    ),
                                  ),
                                  Text(
                                    "playVideo".tr(),
                                    style: TextStyle(
                                      fontSize: 48.sp,
                                      color: Style().textColor,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Text(
                                  "Skin Level ${index + 1}",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 48.sp,
                                    color: Style().textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                context,
              );
            }
          },
        ),
      ),
    );
  }

  Column gunSkinDetailBody(BuildContext context, Data? data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        data?.displayIcon == null
            ? Container(
                height: 500.h,
                padding: EdgeInsets.symmetric(
                  vertical: 100.h,
                  horizontal: 60.w,
                ),
                width: double.infinity,
                color: Style().secondaryColor,
                child: data?.chromas?[0].displayIcon == null
                    ? Container()
                    : Image.network(
                        image ?? data?.chromas?[0].displayIcon.toString() ?? "",
                        fit: BoxFit.contain,
                      ),
              )
            : Container(
                padding: EdgeInsets.symmetric(
                  vertical: 150.h,
                  horizontal: 60.w,
                ),
                width: double.infinity,
                color: Style().secondaryColor,
                child: image == "null"
                    ? Container()
                    : Image.network(
                        image ?? data!.displayIcon.toString(),
                        fit: BoxFit.contain,
                      ),
              ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 40.w),
          child: Row(
            children: [
              Text(
                "gunsColor".tr(),
                style: TextStyle(
                  fontSize: 70.sp,
                  color: Style().textColor,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 24.h),
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
                        debugPrint(image);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      height: 200.h,
                      width: 220.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Style().textColor,
                        ),
                        color: Style().textColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: data?.chromas![index].displayIcon == null
                          ? Image.asset("assets/char/no.png")
                          : Image.network(
                              data!.chromas![index].displayIcon.toString(),
                              fit: BoxFit.contain,
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        ...List.generate(
          data?.levels?.length ?? 0,
          (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Video(
                                  videoUrl:
                                      data?.levels![index].streamedVideo ?? "",
                                );
                              },
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.play_circle_outline,
                          color: Style().iconColor,
                        ),
                      ),
                      Text(
                        "playVideo".tr(),
                        style: TextStyle(
                          fontSize: 48.sp,
                          color: Style().textColor,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Text(
                      data?.levels![index].displayName ?? "",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 48.sp,
                        color: Style().textColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "aaa",
        style: TextStyle(color: Style().primaryColor),
      ),
      backgroundColor: Style().secondaryColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Style().primaryColor,
        ),
      ),
    );
  }
}
