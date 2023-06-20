import 'dart:ui';

import 'package:valoinfos/product/utilities/locator.dart';
import 'package:valoinfos/product/data/abstract_api_client.dart';
import 'package:valoinfos/product/data/api_client.dart';
import 'package:valoinfos/model/Competitivetiers_model.dart';
import 'package:valoinfos/product/model/content_tiers_model.dart';
import 'package:valoinfos/product/model/news_api_model.dart';
import 'package:valoinfos/product/model/map_api_model.dart';
import 'package:valoinfos/product/model/gun_skin_api_model.dart';
import 'package:valoinfos/product/model/gun_api_model.dart';
import 'package:valoinfos/product/model/char_one_api_model.dart';
import 'package:valoinfos/product/model/char_api_model.dart';

class DataRepository extends IApiClient {
  final IApiClient _apiClient = locator<ApiClient>();

  DataRepository._();

  static DataRepository? _instance;

  static DataRepository get instance {
    _instance ??= DataRepository._();
    return _instance!;
  }

  @override
  Future<List<DataChar>?> getChars(Locale locale) async {
    try {
      final data = await _apiClient.getChars(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataCharOne?> getDetailForChar(String charUidd, Locale locale) async {
    try {
      final data = await _apiClient.getDetailForChar(charUidd, locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DataGun>?> getGuns(Locale locale) async {
    try {
      final data = await _apiClient.getGuns(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DataMap>?> getMaps(Locale locale) async {
    try {
      final data = await _apiClient.getMaps(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DataNews>?> getNews(Locale locale) async {
    try {
      final data = await _apiClient.getNews(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataGunSkin?> getSkinForGun(String skinUidd, Locale locale) async {
    try {
      final data = await _apiClient.getSkinForGun(skinUidd, locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataContentTiers?> getContentTiers(String contentUidd, Locale locale) async {
    try {
      final data = await _apiClient.getContentTiers(contentUidd, locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Datum>?> getComp(Locale locale) async {
    try {
      final data = await _apiClient.getComp(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
