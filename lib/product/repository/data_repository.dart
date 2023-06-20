import 'dart:ui';

import 'package:valoinfos/product/models/competitivetiers_model.dart';
import 'package:valoinfos/product/utility/locator.dart';
import 'package:valoinfos/product/services/abstract_api_client.dart';
import 'package:valoinfos/product/services/api_client.dart';
import 'package:valoinfos/product/models/content_tiers_model.dart';
import 'package:valoinfos/product/models/news_api_model.dart';
import 'package:valoinfos/product/models/map_api_model.dart';
import 'package:valoinfos/product/models/gun_skin_api_model.dart';
import 'package:valoinfos/product/models/gun_api_model.dart';
import 'package:valoinfos/product/models/char_one_api_model.dart';
import 'package:valoinfos/product/models/char_api_model.dart';

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
