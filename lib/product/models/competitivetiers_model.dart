// To parse this JSON data, do
//
//     final competitivetiers = competitivetiersFromJson(jsonString);

import 'dart:convert';

Competitivetiers competitivetiersFromJson(String str) => Competitivetiers.fromJson(json.decode(str));

String competitivetiersToJson(Competitivetiers data) => json.encode(data.toJson());

class Competitivetiers {
  int? status;
  List<Datum>? data;

  Competitivetiers({
    this.status,
    this.data,
  });

  factory Competitivetiers.fromJson(Map<String, dynamic> json) => Competitivetiers(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? uuid;
  String? assetObjectName;
  List<Tier>? tiers;
  String? assetPath;

  Datum({
    this.uuid,
    this.assetObjectName,
    this.tiers,
    this.assetPath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        assetObjectName: json["assetObjectName"],
        tiers: json["tiers"] == null ? [] : List<Tier>.from(json["tiers"]!.map((x) => Tier.fromJson(x))),
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "assetObjectName": assetObjectName,
        "tiers": tiers == null ? [] : List<dynamic>.from(tiers!.map((x) => x.toJson())),
        "assetPath": assetPath,
      };
}

class Tier {
  int? tier;
  String? tierName;
  String? division;
  String? divisionName;
  String? color;
  String? backgroundColor;
  String? smallIcon;
  String? largeIcon;
  String? rankTriangleDownIcon;
  String? rankTriangleUpIcon;

  Tier({
    this.tier,
    this.tierName,
    this.division,
    this.divisionName,
    this.color,
    this.backgroundColor,
    this.smallIcon,
    this.largeIcon,
    this.rankTriangleDownIcon,
    this.rankTriangleUpIcon,
  });

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
        tier: json["tier"],
        tierName: json["tierName"],
        division: json["division"],
        divisionName: json["divisionName"],
        color: json["color"],
        backgroundColor: json["backgroundColor"],
        smallIcon: json["smallIcon"],
        largeIcon: json["largeIcon"],
        rankTriangleDownIcon: json["rankTriangleDownIcon"],
        rankTriangleUpIcon: json["rankTriangleUpIcon"],
      );

  Map<String, dynamic> toJson() => {
        "tier": tier,
        "tierName": tierName,
        "division": division,
        "divisionName": divisionName,
        "color": color,
        "backgroundColor": backgroundColor,
        "smallIcon": smallIcon,
        "largeIcon": largeIcon,
        "rankTriangleDownIcon": rankTriangleDownIcon,
        "rankTriangleUpIcon": rankTriangleUpIcon,
      };
}
