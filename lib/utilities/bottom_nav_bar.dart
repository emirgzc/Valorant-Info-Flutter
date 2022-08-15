import 'package:flutter/material.dart';
import 'package:valoinfos/pages/char_page.dart';
import 'package:valoinfos/pages/gun_page.dart';
import 'package:valoinfos/pages/map_page.dart';
import 'package:valoinfos/pages/news_page.dart';
import 'package:valoinfos/utilities/style.dart';

List<Map<String, dynamic>> bottomData = [
  {
    "title": "Gun Page",
    "icon": Icons.home,
    "onPressed": const GunPage(),
  },
  {
    "title": "Agent Page",
    "icon": Icons.support_agent,
    "onPressed": const CharPage(),
  },
  {
    "title": "Maps Page",
    "icon": Icons.map,
    "onPressed": const MapPage(),
  },
  {
    "title": "News Page",
    "icon": Icons.newspaper,
    "onPressed": const NewsPage(),
  },
];

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        unselectedIconTheme:
            IconThemeData(color: Style().primaryColor.withOpacity(0.6)),
        selectedIconTheme: IconThemeData(color: Style().primaryColor),
        selectedItemColor: Style().primaryColor,
        unselectedItemColor: Style().primaryColor.withOpacity(0.6),
        currentIndex: index,
        onTap: (index) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return bottomData[index]["onPressed"];
            },
          ));
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(bottomData[0]["icon"]),
            label: bottomData[0]["title"],
          ),
          BottomNavigationBarItem(
            icon: Icon(bottomData[1]["icon"]),
            label: bottomData[1]["title"],
          ),
          BottomNavigationBarItem(
            icon: Icon(bottomData[2]["icon"]),
            label: bottomData[2]["title"],
          ),
          BottomNavigationBarItem(
            icon: Icon(bottomData[3]["icon"]),
            label: bottomData[3]["title"],
          ),
        ],
      ),
    );
  }
}
