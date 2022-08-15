import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/data/api_client.dart';
import 'package:valoinfos/model/gun_api_model.dart';
import 'package:valoinfos/pages/gun_skin_detail_page.dart';
import 'package:valoinfos/utilities/style.dart';

import '../provider/locale_provider.dart';

class GunSkinPage extends StatefulWidget {
  const GunSkinPage({Key? key, required this.skinsUid}) : super(key: key);
  final List<Skins>? skinsUid;

  @override
  State<GunSkinPage> createState() => _GunSkinPageState();
}

class _GunSkinPageState extends State<GunSkinPage> {
  List<Skins> skins = [];
  // var languageCode;
  @override
  void initState() {
    super.initState();
    skins = widget.skinsUid!;
    // languageCode = Provider.of<LanguageProvider>(context).locale;
  }

  @override
  Widget build(BuildContext context) {
    var languageCode = Provider.of<LanguageProvider>(context, listen: false).locale;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
                    return gunSkinList();
                  } else {
                    return buildLastProcessCardEffect(
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.skinsUid?.length,
                        itemBuilder: (context, index) {
                          return skinForGunEffect(index);
                        },
                      ),
                      context,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget skinForGunEffect(int index) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 60.w,
            ),
            decoration: BoxDecoration(
              color: Style().iconColor.withOpacity(0.4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.skinsUid![index].displayName.toString()),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 30.h),
          padding: EdgeInsets.symmetric(
            horizontal: 60.w,
            vertical: 120.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Style().iconColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: widget.skinsUid![index].displayIcon.toString() == "null"
              ? SizedBox(
                  height: 250.h,
                  child: Image.asset("assets/char/no.png", fit: BoxFit.contain),
                )
              : Image.network(
                  widget.skinsUid![index].displayIcon.toString(),
                ),
        ),
      ],
    );
  }

  Widget gunSkinList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.skinsUid?.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return GunSkinDetailPage(
                    skinUidd: widget.skinsUid![index].uuid.toString(),
                  );
                },
              ),
            );
          },
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 60.w,
                  ),
                  decoration: BoxDecoration(
                    color: Style().iconColor.withOpacity(0.4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.skinsUid![index].displayName.toString(),
                        style: TextStyle(
                          fontSize: 48.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 48.h,
                left: 16.w,
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
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 30.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 60.w,
                  vertical: 120.h,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Style().iconColor.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: widget.skinsUid![index].displayIcon.toString() == "null"
                    ? SizedBox(
                        height: 250.h,
                        child: Image.asset("assets/char/no.png",
                            fit: BoxFit.contain),
                      )
                    : Image.network(
                        widget.skinsUid![index].displayIcon.toString(),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
