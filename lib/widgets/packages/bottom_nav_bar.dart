import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valoinfos/constants/enums.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/translations/locale_keys.g.dart';

class CustomBottomNavbar extends StatefulWidget {
  CustomBottomNavbar(this._currentIndex, {required this.setIndex, super.key});
  final ValueSetter setIndex;
  int _currentIndex;
  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      backgroundColor: Style.whiteColor,
      borderRadius: BorderRadius.circular(Style.defaultRadiusSize / 4),
      opacity: .2,
      hasNotch: true,
      hasInk: true,
      fabLocation: BubbleBottomBarFabLocation.end,
      currentIndex: widget._currentIndex,
      onTap: (value) {
        setState(() {
          widget._currentIndex = value!;
          widget.setIndex(widget._currentIndex);
        });
      },
      elevation: 10,
      tilesPadding: const EdgeInsets.only(
        bottom: 10,
        top: 10,
      ),
      items: [
        bubbleBottomBarItem(
          Style.movieTabColor,
          LogoPath.v2.name.logoPath,
          LocaleKeys.homePage.tr(),
        ),
        bubbleBottomBarItem(
          Style.serieTabColor,
          IconPath.gun.name.iconPath,
          LocaleKeys.guns.tr(),
        ),
        bubbleBottomBarItem(
          Style.favoriteTabColor,
          IconPath.char.name.iconPath,
          LocaleKeys.characters.tr(),
        ),
        bubbleBottomBarItem(
          Style.settingsTabColor,
          IconPath.list.name.iconPath,
          LocaleKeys.diger.tr(),
        ),
      ],
    );
  }

  BubbleBottomBarItem bubbleBottomBarItem(
    Color color,
    String icon,
    String text,
  ) {
    return BubbleBottomBarItem(
      backgroundColor: color,
      icon: SvgPicture.asset(
        icon,
        height: Style.defaullIconHeight * 0.9,
        color: Style.darkTextColor,
      ),
      activeIcon: SvgPicture.asset(
        icon,
        height: Style.defaullIconHeight * 0.9,

        // ignore: deprecated_member_use
        color: color,
      ),
      title: Text(text),
    );
  }
}
