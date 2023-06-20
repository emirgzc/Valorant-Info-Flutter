import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valoinfos/feature/char/char_detail_page.dart';
import 'package:valoinfos/feature/char/char_page.dart';
import 'package:valoinfos/feature/comp/comp_page.dart';
import 'package:valoinfos/feature/gun/gun_details_page.dart';
import 'package:valoinfos/feature/gun/gun_page.dart';
import 'package:valoinfos/feature/gun/gun_skin_detail_page.dart';
import 'package:valoinfos/feature/gun/gun_skins_page.dart';
import 'package:valoinfos/feature/gun/land_scape_player_page.dart';
import 'package:valoinfos/feature/map/map_page.dart';
import 'package:valoinfos/feature/news/news_page.dart';
import 'package:valoinfos/feature/other/other_page.dart';
import 'package:valoinfos/feature/other/settings_page.dart';
import 'package:valoinfos/feature/gun/video.dart';
import 'package:valoinfos/feature/other/way_page.dart';
import 'package:video_player/video_player.dart';

import 'product/models/gun_api_model.dart';

class RouteGenerator {
  static Route<dynamic>? _generateRoute(Widget togoPage, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => togoPage, settings: settings);
  }

  static Route<dynamic>? routeGenrator(RouteSettings settings) {
    switch (settings.name) {
      // home page
      case "/":
        return _generateRoute(const WayPage(), settings);

      // gun page
      case "/gunPage":
        return CupertinoPageRoute(
          builder: (context) => const GunPage(),
          settings: settings,
        );

      // gun page
      case "/gunDetailPage":
        return CupertinoPageRoute(
          builder: (context) => GunDetailsPage(
            gunApiModel: settings.arguments as DataGun,
          ),
          settings: settings,
        );

      case "/gunSkinPage":
        return CupertinoPageRoute(
          builder: (context) => GunSkinPage(
            skinsUid: settings.arguments as DataGun?,
          ),
          settings: settings,
        );

      case "/gunSkinDetailPage":
        return CupertinoPageRoute(
          builder: (context) => GunSkinDetailPage(
            skinUidd: settings.arguments as Skins?,
          ),
          settings: settings,
        );

      // gun page
      case "/charPage":
        return CupertinoPageRoute(
          builder: (context) => const CharPage(),
          settings: settings,
        );

      case "/charDetailPage":
        return CupertinoPageRoute(
          builder: (context) => CharDetailPage(
            charUidd: settings.arguments as String,
          ),
          settings: settings,
        );

      case "/mapsPage":
        return CupertinoPageRoute(
          builder: (context) => const MapPage(),
          settings: settings,
        );

      case "/settingsPage":
        return CupertinoPageRoute(
          builder: (context) => const SettingsPage(),
          settings: settings,
        );
      case "/otherPage":
        return CupertinoPageRoute(
          builder: (context) => const OtherPage(),
          settings: settings,
        );
      case "/newsPage":
        return CupertinoPageRoute(
          builder: (context) => const NewsPage(),
          settings: settings,
        );
      case "/compPage":
        return CupertinoPageRoute(
          builder: (context) => const CompPage(),
          settings: settings,
        );
      case "/landPage":
        return CupertinoPageRoute(
          builder: (context) => LandScapePlayerPage(
            controller: settings.arguments as VideoPlayerController,
          ),
          settings: settings,
        );

        case "/videoPage":
        return CupertinoPageRoute(
          builder: (context) =>  Video(
            videoUrl: settings.arguments as String,
          ),
          settings: settings,
        );

      // unknown page
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("Unknown Route"),
            ),
            body: const Center(
              child: Text("404"),
            ),
          ),
        );
    }
  }
}
