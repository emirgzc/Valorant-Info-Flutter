import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/data/api_client.dart';
import 'package:valoinfos/model/map_api_model.dart';
import 'package:valoinfos/utilities/style.dart';

import '../provider/locale_provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  ApiClient apiClient = ApiClient();
  List<Data> data = [];
  // var languageCode;

  @override
  void initState() {
    // languageCode = Provider.of<LanguageProvider>(context).locale;
    // apiClient.getMaps(languageCode).then(
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
      appBar: AppBar(
        title: Text("maps".tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: defPagePadd,
          child: Column(
            children: [
              FutureBuilder(
                future: ApiClient().getMaps(languageCode),
                builder: (context, snapshot) {
                  var datas = snapshot.data as List<Data>?;
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data != null) {
                    return ListView.builder(
                      itemCount: datas?.length ?? 0,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showAlertDialog(context,
                                    datas?[index].displayIcon.toString());
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 360.h,
                                    margin: EdgeInsets.only(bottom: 48.h),
                                    decoration: const BoxDecoration(),
                                    child: Image.network(
                                      datas![index].listViewIcon.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 48.h),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16.h,
                                        horizontal: 60.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(defRadius),
                                        ),
                                        color:
                                            Style().iconColor.withOpacity(0.8),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            datas[index].displayName.toString(),
                                            style: TextStyle(
                                              fontSize: 48.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Style()
                                                  .primaryColor
                                                  .withOpacity(0.9),
                                            ),
                                          ),
                                          Text(
                                            datas[index].coordinates.toString(),
                                            style: TextStyle(
                                              fontSize: 40.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Style()
                                                  .primaryColor
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 24.h,
                                        right: 24.w,
                                      ),
                                      child: Icon(
                                        Icons.info,
                                        color: Style().iconColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return buildLastProcessCardEffect(
                      ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 360.h,
                            margin: EdgeInsets.only(bottom: 48.h),
                            decoration: const BoxDecoration(),
                            child: Image.asset(
                              "assets/char/no.png",
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                      context,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, String? displayIconMap) {
    showDialog(
      barrierColor: Style().primaryColor.withOpacity(0.8),
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: SizedBox(
            child: displayIconMap == "null"
                ? Image.asset("assets/char/no.png")
                : Image.network(displayIconMap!),
          ),
        );
      },
    );
  }
}
