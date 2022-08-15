class MapApiModel {
  int? status;
  List<Data>? data;

  MapApiModel({this.status, this.data});

  MapApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? uuid;
  String? displayName;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? splash;
  String? assetPath;
  String? mapUrl;
  List<Callouts>? callouts;

  Data(
      {this.uuid,
      this.displayName,
      this.coordinates,
      this.displayIcon,
      this.listViewIcon,
      this.splash,
      this.assetPath,
      this.mapUrl,
      this.callouts});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    coordinates = json['coordinates'];
    displayIcon = json['displayIcon'];
    listViewIcon = json['listViewIcon'];
    splash = json['splash'];
    assetPath = json['assetPath'];
    mapUrl = json['mapUrl'];
    if (json['callouts'] != null) {
      callouts = <Callouts>[];
      json['callouts'].forEach((v) {
        callouts!.add(Callouts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['coordinates'] = coordinates;
    data['displayIcon'] = displayIcon;
    data['listViewIcon'] = listViewIcon;
    data['splash'] = splash;
    data['assetPath'] = assetPath;
    data['mapUrl'] = mapUrl;
    if (callouts != null) {
      data['callouts'] = callouts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Callouts {
  String? regionName;
  String? superRegionName;

  Callouts({this.regionName, this.superRegionName});

  Callouts.fromJson(Map<String, dynamic> json) {
    regionName = json['regionName'];
    superRegionName = json['superRegionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['regionName'] = regionName;
    data['superRegionName'] = superRegionName;

    return data;
  }
}
