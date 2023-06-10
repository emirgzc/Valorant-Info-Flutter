import 'package:flutter/material.dart';
import 'package:valoinfos/constants/locator.dart';
import 'package:valoinfos/data/abstract_api_client.dart';
import 'package:valoinfos/model/Competitivetiers_model.dart';
import 'package:valoinfos/model/content_tiers_model.dart';
import 'package:valoinfos/model/news_api_model.dart';
import 'package:valoinfos/model/map_api_model.dart';
import 'package:valoinfos/model/gun_skin_api_model.dart';
import 'package:valoinfos/model/gun_api_model.dart';
import 'package:valoinfos/model/char_one_api_model.dart';
import 'package:valoinfos/model/char_api_model.dart';
import 'package:valoinfos/repository/data_repository.dart';

class DataViewModel extends IApiClient with ChangeNotifier {
  final DataRepository _repository = locator<DataRepository>();
  @override
  Future<List<DataChar>?> getChars(Locale locale) async {
    try {
      final data = await _repository.getChars(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataCharOne?> getDetailForChar(String charUidd, Locale locale) async {
    try {
      final data = await _repository.getDetailForChar(charUidd, locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DataGun>?> getGuns(Locale locale) async {
    try {
      final data = await _repository.getGuns(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DataMap>?> getMaps(Locale locale) async {
    try {
      final data = await _repository.getMaps(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DataNews>?> getNews(Locale locale) async {
    try {
      final data = await _repository.getNews(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataGunSkin?> getSkinForGun(String skinUidd, Locale locale) async {
    try {
      final data = await _repository.getSkinForGun(skinUidd, locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataContentTiers?> getContentTiers(String contentUidd, Locale locale) async {
    try {
      final data = await _repository.getContentTiers(contentUidd, locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Datum>?> getComp(Locale locale) async {
    try {
      final data = await _repository.getComp(locale);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
