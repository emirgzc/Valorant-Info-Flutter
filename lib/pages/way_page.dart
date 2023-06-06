import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valoinfos/constants/enums.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/pages/char_page.dart';
import 'package:valoinfos/pages/gun_page.dart';
import 'package:valoinfos/pages/home_page.dart';
import 'package:valoinfos/pages/other_page.dart';
import 'package:valoinfos/pages/settings_page.dart';
import 'package:valoinfos/widgets/packages/bottom_nav_bar.dart';

class WayPage extends StatefulWidget {
  const WayPage({super.key});

  @override
  State<WayPage> createState() => _WayPageState();
}

class _WayPageState extends State<WayPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(keepPage: true);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> pageList = [
    const HomePage(),
    const GunPage(),
    const CharPage(),
    const OtherPage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNavbar(
        _currentPage,
        setIndex: (index) {
          _pageController.jumpToPage(index);
        },
      ),
      floatingActionButton: floatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: body(),
    );
  }

  Widget body() {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      onPageChanged: (value) {
        if (value != 4) {
          setState(() {
            _currentPage = value;
          });
        }
      },
      controller: _pageController,
      itemCount: pageList.length,
      itemBuilder: (context, index) {
        return pageList[index];
      },
    );
  }

  Widget floatingButton() {
    return FloatingActionButton(
      onPressed: () {
        _pageController.jumpToPage(4);
        //Navigator.of(context).pushNamed("/gunPage");
      },
      elevation: 0,
      backgroundColor: Style.fabColor,
      child: Container(
        padding: EdgeInsets.all(Style.defaultPaddingSize * 0.9),
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: SvgPicture.asset(
          IconPath.settings.name.iconPath,
          height: Style.defaullIconHeight,
          // ignore: deprecated_member_use
          color: Style.whiteColor,
        ),
      ),
    );
  }
}
