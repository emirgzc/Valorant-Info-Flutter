import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:valoinfos/product/models/competitivetiers_model.dart';
import 'package:valoinfos/product/utility/extension.dart';
import 'package:valoinfos/product/models/char_api_model.dart';
import 'package:valoinfos/product/models/char_one_api_model.dart';
import 'package:valoinfos/product/models/content_tiers_model.dart';
import 'package:valoinfos/product/models/gun_api_model.dart';
import 'package:valoinfos/product/models/gun_skin_api_model.dart';
import 'package:http/http.dart' as http;
import 'package:valoinfos/product/models/map_api_model.dart';
import 'package:valoinfos/product/models/news_api_model.dart';

import 'abstract_api_client.dart';

class ApiClient extends IApiClient {
  final String _baseUrl = "https://valorant-api.com/v1";

  @override
  Future<List<DataMap>?> getMaps(Locale locale) async {
    String languageKey = switchLanguage(locale);
    String apiUrl = "$_baseUrl/maps?language=$languageKey";

    final response = await http.get(
      Uri.parse(apiUrl),
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      MapApiModel mapApiModel = MapApiModel.fromJson(responseJson);
      return mapApiModel.data;
    } else {
      throw Exception('getMaps apide hata var');
    }
  }

  @override
  Future<List<DataGun>?> getGuns(Locale locale) async {
    String languageKey = switchLanguage(locale);
    String apiUrl = "$_baseUrl/weapons?language=$languageKey";

    final response = await http.get(
      Uri.parse(apiUrl),
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      GunApiModel gunApiModel = GunApiModel.fromJson(responseJson);
      return gunApiModel.data;
    } else {
      throw Exception('getGuns apide hata var');
    }
  }

  @override
  Future<DataGunSkin?> getSkinForGun(String skinUidd, Locale locale) async {
    String languageKey = switchLanguage(locale);
    String apiUrl = "$_baseUrl/weapons/skins/$skinUidd?language=$languageKey";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        GunSkinApiModel gunskinApiModel = GunSkinApiModel.fromJson(responseJson);
        return gunskinApiModel.data;
      } else {
        throw Exception('getSkinForGun apide hata var');
      }
    } catch (e) {
      throw Exception('getSkinForGun apide hata var');
    }
  }

  @override
  Future<List<DataChar>?> getChars(Locale locale) async {
    String languageKey = switchLanguage(locale);
    String apiUrl = "$_baseUrl/agents?language=$languageKey&isPlayableCharacter=true";

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'language': 'tr-TR',
        'isPlayableCharacter': "true",
      },
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      CharApiModel charApiModel = CharApiModel.fromJson(responseJson);
      return charApiModel.data;
    } else {
      throw Exception('getChars apide hata var');
    }
  }

  @override
  Future<DataCharOne?> getDetailForChar(String charUidd, Locale locale) async {
    String languageKey = switchLanguage(locale);
    String apiUrl = "$_baseUrl/agents/$charUidd?language=$languageKey";

    final response = await http.get(
      Uri.parse(apiUrl),
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      CharOneApiModel charSkinApiModel = CharOneApiModel.fromJson(responseJson);
      return charSkinApiModel.data;
    } else {
      throw Exception('getDetailForChar apide hata var');
    }
  }

  @override
  Future<List<DataNews>?> getNews(Locale locale) async {
    String languageKey = switchLanguage(locale);
    String apiUrl = "$_baseUrl/bundles?language=$languageKey";
    final response = await http.get(
      Uri.parse(apiUrl),
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      NewsApiModel newsApiModel = NewsApiModel.fromJson(responseJson);
      return newsApiModel.data;
    } else {
      throw Exception('getNews apide hata var');
    }
  }

  @override
  Future<DataContentTiers?> getContentTiers(String contentUidd, Locale locale) async {
    String languageKey = switchLanguage(locale);
    //String apiUrl = "https://valorant-api.com/v1/contenttiers/$contentUidd?language=tr-TR";
    String apiUrl = 'https://valorant-api.com/v1/contenttiers/$contentUidd?language=tr-TR';

    final response = await http.get(
      Uri.parse(apiUrl),
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      ContentTiers newsApiModel = ContentTiers.fromJson(responseJson);
      return newsApiModel.data;
    } else {
      throw Exception('getContentTiers apide hata var');
    }
  }

  @override
  Future<List<Datum>?> getComp(Locale locale) async {
    String languageKey = switchLanguage(locale);
    String apiUrl = "$_baseUrl/competitivetiers?language=$languageKey";

    final response = await http.get(
      Uri.parse(apiUrl),
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      Competitivetiers newsApiModel = Competitivetiers.fromJson(responseJson);
      return newsApiModel.data;
    } else {
      throw Exception('getComp apide hata var');
    }
  }
}
