// To parse this JSON data, do
//
//     final contentTiers = contentTiersFromJson(jsonString);

import 'dart:convert';

ContentTiers contentTiersFromJson(String str) => ContentTiers.fromJson(json.decode(str));

String contentTiersToJson(ContentTiers data) => json.encode(data.toJson());

class ContentTiers {
    int? status;
    DataContentTiers? data;

    ContentTiers({
        this.status,
        this.data,
    });

    factory ContentTiers.fromJson(Map<String, dynamic> json) => ContentTiers(
        status: json["status"],
        data: json["data"] == null ? null : DataContentTiers.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class DataContentTiers {
    String? uuid;
    String? displayName;
    String? devName;
    int? rank;
    int? juiceValue;
    int? juiceCost;
    String? highlightColor;
    String? displayIcon;
    String? assetPath;

    DataContentTiers({
        this.uuid,
        this.displayName,
        this.devName,
        this.rank,
        this.juiceValue,
        this.juiceCost,
        this.highlightColor,
        this.displayIcon,
        this.assetPath,
    });

    factory DataContentTiers.fromJson(Map<String, dynamic> json) => DataContentTiers(
        uuid: json["uuid"],
        displayName: json["displayName"],
        devName: json["devName"],
        rank: json["rank"],
        juiceValue: json["juiceValue"],
        juiceCost: json["juiceCost"],
        highlightColor: json["highlightColor"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "devName": devName,
        "rank": rank,
        "juiceValue": juiceValue,
        "juiceCost": juiceCost,
        "highlightColor": highlightColor,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
    };
}
