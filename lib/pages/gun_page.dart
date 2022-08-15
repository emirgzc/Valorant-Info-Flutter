import 'package:bordered_text/bordered_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/data/api_client.dart';
import 'package:valoinfos/model/gun_api_model.dart';
import 'package:valoinfos/pages/gun_details_page.dart';
import 'package:valoinfos/provider/locale_provider.dart';
import 'package:valoinfos/utilities/style.dart';

class GunPage extends StatefulWidget {
  const GunPage({Key? key}) : super(key: key);

  @override
  State<GunPage> createState() => _GunPageState();
}

class _GunPageState extends State<GunPage> {
  int charIndex = 0;
  String appTitle = "guns".tr();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: gunPageBody(),
    );
  }

  Widget gunPageBody() {
    var languageCode =
        Provider.of<LanguageProvider>(context, listen: false).locale;
    debugPrint(languageCode.toString());

    return SingleChildScrollView(
      child: Padding(
        padding: defPagePadd,
        child: Column(
          children: [
            FutureBuilder(
              future: ApiClient().getGuns(languageCode),
              builder: (context, snapshot) {
                var datas = snapshot.data as List<Data>?;
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data != null) {
                  return gunList(datas);
                } else {
                  return buildLastProcessCardEffect(
                    effectGunCard(),
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

  Widget effectGunCard() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 40.h,
        crossAxisSpacing: 50.w,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Style().secondaryColor,
          ),
          child: const Text("sadasddsdasdad"),
        );
      },
    );
  }

  Widget gunList(List<Data>? datas) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: datas?.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 40.h,
        crossAxisSpacing: 50.w,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GunDetailsPage(
                gunApiModel: datas![index],
              ),
            ),
          ),
          child: Stack(
            children: [
              gunImage(datas, index),
              gunNameTitle(datas, index),
              skinLengthTitle(datas, index),
            ],
          ),
        );
      },
    );
  }

  Widget gunImage(List<Data>? datas, int index) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 40.w,
        vertical: 80.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.withOpacity(0.2),
        ),
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defRadius),
          bottomRight: Radius.circular(defRadius),
        ),
      ),
      child: Image.network(
        datas?[index].displayIcon.toString() ?? "",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget gunNameTitle(List<Data>? datas, int index) {
    return Positioned(
      top: 0,
      child: Padding(
        padding: EdgeInsets.only(
          left: 30.w,
          top: 30.h,
        ),
        child: BorderedText(
          strokeWidth: 1.0,
          strokeColor: Style().textColor.withOpacity(0.5),
          child: Text(
            "${datas?[index].displayName ?? ""}.",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.15),
              letterSpacing: 2,
              fontSize: 48.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget skinLengthTitle(List<Data>? datas, int index) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.h, right: 30.w),
        child: BorderedText(
          strokeWidth: 1.0,
          strokeColor: Style().textColor.withOpacity(0.5),
          child: Text(
            "${datas?[index].skins!.length ?? ""} ${"skinsLenght".tr()}",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.15),
              letterSpacing: 2,
              fontSize: 30.sp,
            ),
          ),
        ),
      ),
    );
  }
}
