import 'package:bordered_text/bordered_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/data/api_client.dart';
import 'package:valoinfos/model/char_api_model.dart';
import 'package:valoinfos/pages/char_detail_page.dart';
import 'package:valoinfos/provider/locale_provider.dart';
import 'package:valoinfos/utilities/style.dart';

class CharPage extends StatefulWidget {
  const CharPage({Key? key}) : super(key: key);

  @override
  State<CharPage> createState() => _CharPageState();
}

class _CharPageState extends State<CharPage> {
  String appTitle = "characters".tr();
  ApiClient apiClient = ApiClient();
  // List<Data> data = [];
  int charIndex = 1;

  @override
  void initState() {
    // apiClient.getChars(languageCode).then(
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
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: charBody(),
    );
  }

  Widget charBody() {
    var languageCode =
        Provider.of<LanguageProvider>(context, listen: false).locale;

    return SingleChildScrollView(
      child: Padding(
        padding: defPagePadd,
        child: Column(
          children: [
            FutureBuilder(
              future: ApiClient().getChars(languageCode),
              builder: (context, snapshot) {
                var datas = snapshot.data as List<Data>?;
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data != null) {
                  return listChar(datas);
                } else {
                  return buildLastProcessCardEffect(
                    listCharForEffect(null),
                    context,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget listCharForEffect(List<Data>? datas) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: 600.h,
          decoration: BoxDecoration(
            color: Style().secondaryColor,
            borderRadius: BorderRadius.circular(defRadius),
          ),
          margin: EdgeInsets.only(bottom: 40.h),
          width: double.infinity,
        );
      },
    );
  }

  Widget listChar(List<Data>? datas) {
    return ListView.builder(
      itemCount: datas!.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return charCard(context, index, datas);
      },
    );
  }

  Widget charCard(BuildContext context, int index, List<Data>? datas) {
    debugPrint(datas![index].uuid.toString());
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharDetailPage(
              charUidd: datas[index].uuid.toString(),
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 600.h,
            decoration: BoxDecoration(
              color: Style().secondaryColor,
              borderRadius: BorderRadius.circular(defRadius),
            ),
            margin: EdgeInsets.only(bottom: 40.h),
            width: double.infinity,
            child: Stack(
              children: [
                nameCharTitle(index, datas),
                imageChar(index, datas),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget imageChar(int index, List<Data>? datas) {
    return Positioned(
      bottom: 0,
      right: 80.w,
      child: SizedBox(
        height: 550.h,
        child: datas![index].displayName.toString() == "FADE" ||
                datas[index].displayName.toString() == "Fade" ||
                datas[index].displayName.toString() == "فايد"
            ? Image.asset("assets/char/fade.webp")
            : datas[index].displayName.toString() == "BREACH" ||
                    datas[index].displayName.toString() == "Breach"
                ? Image.asset("assets/char/breach.webp")
                : datas[index].displayName.toString() == "RAZE" ||
                        datas[index].displayName.toString() == "Raze"
                    ? Image.asset("assets/char/raze.webp")
                    : datas[index].displayName.toString() == "CHAMBER" ||
                            datas[index].displayName.toString() == "Chamber"
                        ? Image.asset("assets/char/chamber.webp")
                        : datas[index].displayName.toString() == "KAY/O" ||
                                datas[index].displayName.toString() == "Kay/o"
                            ? Image.asset("assets/char/kayo.webp")
                            : datas[index].displayName.toString() == "SKYE" ||
                                    datas[index].displayName.toString() ==
                                        "Skye"
                                ? Image.asset("assets/char/skye.webp")
                                : datas[index].displayName.toString() == "CYPHER" ||
                                        datas[index].displayName.toString() ==
                                            "Cypher"
                                    ? Image.asset("assets/char/cypher.webp")
                                    : datas[index].displayName.toString() == "SOVA" ||
                                            datas[index].displayName.toString() ==
                                                "Sova"
                                        ? Image.asset("assets/char/sova.webp")
                                        : datas[index].displayName.toString() ==
                                                    "KILLJOY" ||
                                                datas[index].displayName.toString() ==
                                                    "Killjoy"
                                            ? Image.asset(
                                                "assets/char/killjoy.webp")
                                            : datas[index].displayName.toString() == "VIPER" ||
                                                    datas[index].displayName.toString() ==
                                                        "Viper"
                                                ? Image.asset(
                                                    "assets/char/viper.webp")
                                                : datas[index].displayName.toString() ==
                                                            "PHOENIX" ||
                                                        datas[index]
                                                                .displayName
                                                                .toString() ==
                                                            "Phoenix"
                                                    ? Image.asset("assets/char/phoenix.webp")
                                                    : datas[index].displayName.toString() == "ASTRA" || datas[index].displayName.toString() == "Astra"
                                                        ? Image.asset("assets/char/astra.webp")
                                                        : datas[index].displayName.toString() == "BRIMSTONE" || datas[index].displayName.toString() == "Brimstone"
                                                            ? Image.asset("assets/char/brim.webp")
                                                            : datas[index].displayName.toString() == "NEON" || datas[index].displayName.toString() == "Neon"
                                                                ? Image.asset("assets/char/neon.webp")
                                                                : datas[index].displayName.toString() == "YORU" || datas[index].displayName.toString() == "Yoru"
                                                                    ? Image.asset("assets/char/yoru.webp")
                                                                    : datas[index].displayName.toString() == "SAGE" || datas[index].displayName.toString() == "Sage"
                                                                        ? Image.asset("assets/char/sage.webp")
                                                                        : datas[index].displayName.toString() == "REYNA" || datas[index].displayName.toString() == "Reyna"
                                                                            ? Image.asset("assets/char/reyna.webp")
                                                                            : datas[index].displayName.toString() == "OMEN" || datas[index].displayName.toString() == "Omen"
                                                                                ? Image.asset("assets/char/omen.webp")
                                                                                : datas[index].displayName.toString() == "JETT" || datas[index].displayName.toString() == "Jett"
                                                                                    ? Image.asset("assets/char/jett.webp")
                                                                                    : Image.asset("assets/char/no.png"),
      ),
    );
  }

  Widget nameCharTitle(int index, List<Data>? datas) {
    return Positioned(
      bottom: 10.h,
      left: 30.w,
      child: BorderedText(
        strokeWidth: 3.0,
        strokeColor: Style().iconColor,
        child: Text(
          datas![index].displayName.toString(),
          style: TextStyle(
            color: Style().secondaryColor,
            fontSize: 180.sp,
            shadows: [
              Shadow(
                blurRadius: 5,
                color: Style().iconColor.withOpacity(0.1),
                offset: const Offset(5, 5),
              ),
            ],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
