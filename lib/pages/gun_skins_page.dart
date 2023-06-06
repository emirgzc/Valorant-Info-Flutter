import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/model/gun_api_model.dart';
import 'package:valoinfos/pages/gun_skin_detail_page.dart';
import 'package:valoinfos/translations/locale_keys.g.dart';
import 'package:valoinfos/utilities/strings.dart';
import 'package:valoinfos/widgets/custom_appbar.dart';
import 'package:valoinfos/widgets/packages/cache_image.dart';

class GunSkinPage extends StatefulWidget {
  const GunSkinPage({Key? key, required this.skinsUid}) : super(key: key);
  final DataGun? skinsUid;

  @override
  State<GunSkinPage> createState() => _GunSkinPageState();
}

class _GunSkinPageState extends State<GunSkinPage> {
  List<Skins> skins = [];
  // var languageCode;
  @override
  void initState() {
    super.initState();
    skins = widget.skinsUid?.skins ?? [];
    // languageCode = Provider.of<LanguageProvider>(context).locale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: Style.pagePadding,
        child: gunSkinList(),
      ),
    );
  }

  Widget gunSkinList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.skinsUid?.skins?.length ?? 0,
      itemBuilder: (context, index) {
        return gunSkinCard(context, index);
      },
    );
  }

  Widget gunSkinCard(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return GunSkinDetailPage(
                skinUidd: widget.skinsUid?.skins?[index],
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
            child: titleGun(index),
          ),
          Positioned(
            bottom: 48.h,
            left: 16.w,
            child: detailButton(context),
          ),
          imageGun(index),
        ],
      ),
    );
  }

  Widget titleGun(int index) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Style.defaultPaddingSize * 0.3,
        horizontal: Style.defaultPaddingSize * 0.7,
      ),
      decoration: BoxDecoration(
        color: Style.darkTextColor.withOpacity(0.2),
      ),
      child: Text(
        widget.skinsUid?.skins?[index].displayName ?? StringData.noData,
        style: context.theme.titleSmall!.copyWith(
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget detailButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Style.defaultPaddingSize * 0.2,
        horizontal: Style.defaultPaddingSize / 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Style.darkTextColor.withOpacity(0.6),
        ),
      ),
      child: Text(
        LocaleKeys.details.tr(),
        style: context.theme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget imageGun(int index) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: Style.defaultPaddingSize * 0.5),
      padding: EdgeInsets.symmetric(
        horizontal: 60.w,
        vertical: 120.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Style.darkTextColor.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(Style.defaultRadiusSize),
      ),
      child: CacheImage(
        image: widget.skinsUid?.skins?[index].displayIcon ?? (widget.skinsUid?.skins?[index].chromas?[0].fullRender),
        fit: BoxFit.contain,
        height: 270.h,
      ),
    );
  }
}
