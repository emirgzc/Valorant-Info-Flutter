import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valoinfos/product/utility/extension.dart';
import 'package:valoinfos/product/utility/style.dart';
import 'package:valoinfos/product/utility/translations/locale_keys.g.dart';
import 'package:valoinfos/product/widgets/custom_appbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(LocaleKeys.settings.tr()),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Padding(
      padding: Style.pagePadding,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                context.locale.languageCode == LanguageCodes.tr.name ? 'Türkçe' : 'English',
                style: context.theme.titleLarge,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    context.setLocale(
                      Locale(LanguageCodes.tr.name),
                    );
                  });
                },
                child: Image.asset(
                  'assets/images/tr.jpeg',
                  height: 90.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: Style.defaultPaddingSize),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      context.setLocale(
                        Locale(LanguageCodes.en.name),
                      );
                    });
                  },
                  child: Image.asset(
                    'assets/images/en.jpeg',
                    height: 90.h,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
