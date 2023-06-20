import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valoinfos/product/utility/style.dart';
import 'package:valoinfos/feature/char/char_page.dart';
import 'package:valoinfos/feature/gun/gun_page.dart';
import 'package:valoinfos/feature/home/home_page.dart';
import 'package:valoinfos/feature/other/other_page.dart';
import 'package:valoinfos/feature/other/settings_page.dart';
import 'package:valoinfos/product/enums/icon_constants.dart';
import 'package:valoinfos/product/widgets/packages/bottom_nav_bar.dart';
import 'package:valoinfos/product/widgets/rate_app_init_widget.dart';

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
    RateAppInitWidget(
      builder: (rateMyApp) => HomePage(
        rateMyApp: rateMyApp,
      ),
    ),
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
        //Navigator.of(context).pushNamed("/onBoardingPage");
      },
      elevation: 0,
      backgroundColor: Style.fabColor,
      child: Container(
        padding: EdgeInsets.all(Style.defaultPaddingSize * 0.9),
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: SvgPicture.asset(
          IconConstants.settings.toIcon,
          height: Style.defaullIconHeight,
          // ignore: deprecated_member_use
          color: Style.whiteColor,
        ),
      ),
    );
  }
}
