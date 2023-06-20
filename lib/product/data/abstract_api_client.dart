import 'package:flutter/material.dart';
import 'package:valoinfos/model/Competitivetiers_model.dart';
import 'package:valoinfos/product/model/char_api_model.dart';
import 'package:valoinfos/product/model/char_one_api_model.dart';
import 'package:valoinfos/product/model/content_tiers_model.dart';
import 'package:valoinfos/product/model/gun_api_model.dart';
import 'package:valoinfos/product/model/gun_skin_api_model.dart';
import 'package:valoinfos/product/model/map_api_model.dart';
import 'package:valoinfos/product/model/news_api_model.dart';

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
