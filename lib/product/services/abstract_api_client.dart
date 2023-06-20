import 'package:flutter/material.dart';
import 'package:valoinfos/product/models/char_api_model.dart';
import 'package:valoinfos/product/models/char_one_api_model.dart';
import 'package:valoinfos/product/models/competitivetiers_model.dart';
import 'package:valoinfos/product/models/content_tiers_model.dart';
import 'package:valoinfos/product/models/gun_api_model.dart';
import 'package:valoinfos/product/models/gun_skin_api_model.dart';
import 'package:valoinfos/product/models/map_api_model.dart';
import 'package:valoinfos/product/models/news_api_model.dart';

abstract class IApiClient {
  Future<List<DataMap>?> getMaps(Locale locale);
  Future<List<DataGun>?> getGuns(Locale locale);
  Future<DataGunSkin?> getSkinForGun(String skinUidd, Locale locale);
  Future<List<DataChar>?> getChars(Locale locale);
  Future<DataCharOne?> getDetailForChar(String charUidd, Locale locale);
  Future<List<DataNews>?> getNews(Locale locale);
  Future<DataContentTiers?> getContentTiers(String contentUidd, Locale locale);
  Future<List<Datum>?> getComp(Locale locale);

}
