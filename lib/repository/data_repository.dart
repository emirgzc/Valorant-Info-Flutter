import 'dart:ui';

import 'package:valoinfos/constants/locator.dart';
import 'package:valoinfos/data/abstract_api_client.dart';
import 'package:valoinfos/data/api_client.dart';
import 'package:valoinfos/model/Competitivetiers_model.dart';
import 'package:valoinfos/model/content_tiers_model.dart';
import 'package:valoinfos/model/news_api_model.dart';
import 'package:valoinfos/model/map_api_model.dart';
import 'package:valoinfos/model/gun_skin_api_model.dart';
import 'package:valoinfos/model/gun_api_model.dart';
import 'package:valoinfos/model/char_one_api_model.dart';
import 'package:valoinfos/model/char_api_model.dart';

class DataRepository extends IApiClient {
  final IApiClient _apiClient = locator<ApiClient>();

  DataRepository._();

  static DataRepository? _instance;

  static DataRepository get instance {
    _instance ??= DataRepository._();
    return _instance!;
  }

  @override
  Future<List<DataChar>?> getChars(Locale locale) {
    try {
      final data = _apiClient.getChars(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataCharOne?> getDetailForChar(String charUidd, Locale locale) {
    try {
      final data = _apiClient.getDetailForChar(charUidd, locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DataGun>?> getGuns(Locale locale) {
    try {
      final data = _apiClient.getGuns(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DataMap>?> getMaps(Locale locale) {
    try {
      final data = _apiClient.getMaps(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DataNews>?> getNews(Locale locale) {
    try {
      final data = _apiClient.getNews(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataGunSkin?> getSkinForGun(String skinUidd, Locale locale) {
    try {
      final data = _apiClient.getSkinForGun(skinUidd, locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataContentTiers?> getContentTiers(String contentUidd, Locale locale) {
    try {
      final data = _apiClient.getContentTiers(contentUidd, locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Datum>?> getComp(Locale locale) {
    try {
      final data = _apiClient.getComp(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
