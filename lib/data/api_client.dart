import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:valoinfos/model/char_api_model.dart' as char;
import 'package:valoinfos/model/char_one_api_model.dart' as charDetail;
import 'package:valoinfos/model/gun_api_model.dart' as gun;
import 'package:valoinfos/model/gun_skin_api_model.dart' as gunskin;
import 'package:valoinfos/model/map_api_model.dart' as map;
import 'package:http/http.dart' as http;
import 'package:valoinfos/model/news_api_model.dart' as news;

class ApiClient {
  final String baseUrl = "https://valorant-api.com/";
  Future<List<map.Data>?> getMaps(Locale locale) async {
    String languageUpperCode = locale.languageCode == "tr"
        ? "TR"
        : locale.languageCode == "en"
            ? "US"
            : locale.languageCode == "ar"
                ? "AE"
                : "TR";
    String apiUrl =
        "https://valorant-api.com/v1/maps?language=${locale.languageCode}-$languageUpperCode";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'language': '${locale.languageCode}-$languageUpperCode',
        },
      );
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        map.MapApiModel mapApiModel = map.MapApiModel.fromJson(responseJson);
        return mapApiModel.data;
      } else {
        throw Exception('getMaps apide hata var');
      }
    } catch (e) {
      debugPrint("hata $e");
    }
    return null;
  }

  Future<List<gun.Data>?> getGuns(Locale locale) async {
    String languageUpperCode = locale.languageCode == "tr"
        ? "TR"
        : locale.languageCode == "en"
            ? "US"
            : locale.languageCode == "ar"
                ? "AE"
                : "TR";
    String apiUrl =
        "https://valorant-api.com/v1/weapons?language=${locale.languageCode}-$languageUpperCode";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'language': '${locale.languageCode}-$languageUpperCode',
        },
      );
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        gun.GunApiModel gunApiModel = gun.GunApiModel.fromJson(responseJson);
        return gunApiModel.data;
      } else {
        throw Exception('getGuns apide hata var');
      }
    } catch (e) {
      debugPrint("hata $e");
    }
    return null;
  }

  Future<gunskin.Data?> getSkinForGun(String skinUidd, Locale locale) async {
    String languageUpperCode = locale.languageCode == "tr"
        ? "TR"
        : locale.languageCode == "en"
            ? "US"
            : locale.languageCode == "ar"
                ? "AE"
                : "TR";
    debugPrint("code language weapons : $languageUpperCode");
    String apiUrl =
        "https://valorant-api.com/v1/weapons/skins/$skinUidd?language=${locale.languageCode}-$languageUpperCode";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'language': '${locale.languageCode}-$languageUpperCode',
        },
      );
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        gunskin.GunSkinApiModel gunskinApiModel =
            gunskin.GunSkinApiModel.fromJson(responseJson);
        return gunskinApiModel.data;
      } else {
        throw Exception('getSkinForGun apide hata var');
      }
    } catch (e) {
      debugPrint("hata $e");
    }
    return null;
  }

  Future<List<char.Data>?> getChars(Locale locale) async {
    String languageUpperCode = locale.languageCode == "tr"
        ? "TR"
        : locale.languageCode == "en"
            ? "US"
            : locale.languageCode == "ar"
                ? "AE"
                : "TR";
    debugPrint("code language chars : $languageUpperCode");
    String apiUrl =
        "https://valorant-api.com/v1/agents?language=${locale.languageCode}-$languageUpperCode&isPlayableCharacter=true";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'language': '${locale.languageCode}-$languageUpperCode',
          'isPlayableCharacter': "true",
        },
      );
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        char.CharApiModel charApiModel =
            char.CharApiModel.fromJson(responseJson);
        return charApiModel.data;
      } else {
        throw Exception('getChars apide hata var');
      }
    } catch (e) {
      debugPrint("hata $e");
    }
    return null;
  }

  Future<charDetail.Data?> getDetailForChar(
      String charUidd, Locale locale) async {
    String languageUpperCode = locale.languageCode == "tr"
        ? "TR"
        : locale.languageCode == "en"
            ? "US"
            : locale.languageCode == "ar"
                ? "AE"
                : "TR";
    debugPrint("code language chars detail : $languageUpperCode");
    String apiUrl =
        "https://valorant-api.com/v1/agents/$charUidd?language=${locale.languageCode}-$languageUpperCode";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'language': '${locale.languageCode}-$languageUpperCode',
        },
      );
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        debugPrint("-----------$responseJson");
        charDetail.CharOneApiModel charSkinApiModel =
            charDetail.CharOneApiModel.fromJson(responseJson);
        return charSkinApiModel.data;
      } else {
        throw Exception('getDetailForChar apide hata var');
      }
    } catch (e) {
      debugPrint("hata $e");
    }
    return null;
  }

  Future<List<news.Data>?> getNews(Locale locale) async {
    String languageUpperCode = locale.languageCode == "tr"
        ? "TR"
        : locale.languageCode == "en"
            ? "US"
            : locale.languageCode == "ar"
                ? "AE"
                : "TR";
    String apiUrl =
        "https://valorant-api.com/v1/bundles?language=${locale.languageCode}-$languageUpperCode&isPlayableCharacter=true";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'language': '${locale.languageCode}-$languageUpperCode',
        },
      );
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        news.NewsApiModel newsApiModel =
            news.NewsApiModel.fromJson(responseJson);
        return newsApiModel.data;
      } else {
        throw Exception('getNews apide hata var');
      }
    } catch (e) {
      debugPrint("hata $e");
    }
    return null;
  }
}
