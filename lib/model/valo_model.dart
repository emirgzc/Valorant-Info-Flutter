class ValoModel {
  String? version;
  List<Charcters>? characters;
  List<Maps>? maps;
  List<Chromas>? chromas;
  List<Skins>? skins;
  List<SkinLevels>? skinLevels;
  List<Equips>? equips;
  List<GameModes>? gameModes;
  List<Sprays>? sprays;
  List<SprayLevels>? sprayLevels;
  List<Charms>? charms;
  List<CharmLevels>? charmLevels;
  List<PlayerCards>? playerCards;
  List<PlayerTitles>? playerTitles;
  List<Acts>? acts;
  List<Ceremonies>? ceremonies;

  ValoModel(
      {this.version,
      this.characters,
      this.maps,
      this.chromas,
      this.skins,
      this.skinLevels,
      this.equips,
      this.gameModes,
      this.sprays,
      this.sprayLevels,
      this.charms,
      this.charmLevels,
      this.playerCards,
      this.playerTitles,
      this.acts,
      this.ceremonies});

  ValoModel.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    if (json['characters'] != null) {
      characters = <Charcters>[];
      json['characters'].forEach((v) {
        characters!.add(Charcters.fromJson(v));
      });
    }
    if (json['maps'] != null) {
      maps = <Maps>[];
      json['maps'].forEach((v) {
        maps!.add(Maps.fromJson(v));
      });
    }
    if (json['chromas'] != null) {
      chromas = <Chromas>[];
      json['chromas'].forEach((v) {
        chromas!.add(Chromas.fromJson(v));
      });
    }
    if (json['skins'] != null) {
      skins = <Skins>[];
      json['skins'].forEach((v) {
        skins!.add(Skins.fromJson(v));
      });
    }
    if (json['skinLevels'] != null) {
      skinLevels = <SkinLevels>[];
      json['skinLevels'].forEach((v) {
        skinLevels!.add(SkinLevels.fromJson(v));
      });
    }
    if (json['equips'] != null) {
      equips = <Equips>[];
      json['equips'].forEach((v) {
        equips!.add(Equips.fromJson(v));
      });
    }
    if (json['gameModes'] != null) {
      gameModes = <GameModes>[];
      json['gameModes'].forEach((v) {
        gameModes!.add(GameModes.fromJson(v));
      });
    }
    if (json['sprays'] != null) {
      sprays = <Sprays>[];
      json['sprays'].forEach((v) {
        sprays!.add(Sprays.fromJson(v));
      });
    }
    if (json['sprayLevels'] != null) {
      sprayLevels = <SprayLevels>[];
      json['sprayLevels'].forEach((v) {
        sprayLevels!.add(SprayLevels.fromJson(v));
      });
    }
    if (json['charms'] != null) {
      charms = <Charms>[];
      json['charms'].forEach((v) {
        charms!.add(Charms.fromJson(v));
      });
    }
    if (json['charmLevels'] != null) {
      charmLevels = <CharmLevels>[];
      json['charmLevels'].forEach((v) {
        charmLevels!.add(CharmLevels.fromJson(v));
      });
    }
    if (json['playerCards'] != null) {
      playerCards = <PlayerCards>[];
      json['playerCards'].forEach((v) {
        playerCards!.add(PlayerCards.fromJson(v));
      });
    }
    if (json['playerTitles'] != null) {
      playerTitles = <PlayerTitles>[];
      json['playerTitles'].forEach((v) {
        playerTitles!.add(PlayerTitles.fromJson(v));
      });
    }
    if (json['acts'] != null) {
      acts = <Acts>[];
      json['acts'].forEach((v) {
        acts!.add(Acts.fromJson(v));
      });
    }
    if (json['ceremonies'] != null) {
      ceremonies = <Ceremonies>[];
      json['ceremonies'].forEach((v) {
        ceremonies!.add(Ceremonies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    if (characters != null) {
      data['characters'] = characters!.map((v) => v.toJson()).toList();
    }
    if (maps != null) {
      data['maps'] = maps!.map((v) => v.toJson()).toList();
    }
    if (chromas != null) {
      data['chromas'] = chromas!.map((v) => v.toJson()).toList();
    }
    if (skins != null) {
      data['skins'] = skins!.map((v) => v.toJson()).toList();
    }
    if (skinLevels != null) {
      data['skinLevels'] = skinLevels!.map((v) => v.toJson()).toList();
    }
    if (equips != null) {
      data['equips'] = equips!.map((v) => v.toJson()).toList();
    }
    if (gameModes != null) {
      data['gameModes'] = gameModes!.map((v) => v.toJson()).toList();
    }
    if (sprays != null) {
      data['sprays'] = sprays!.map((v) => v.toJson()).toList();
    }
    if (sprayLevels != null) {
      data['sprayLevels'] = sprayLevels!.map((v) => v.toJson()).toList();
    }
    if (charms != null) {
      data['charms'] = charms!.map((v) => v.toJson()).toList();
    }
    if (charmLevels != null) {
      data['charmLevels'] = charmLevels!.map((v) => v.toJson()).toList();
    }
    if (playerCards != null) {
      data['playerCards'] = playerCards!.map((v) => v.toJson()).toList();
    }
    if (playerTitles != null) {
      data['playerTitles'] = playerTitles!.map((v) => v.toJson()).toList();
    }
    if (acts != null) {
      data['acts'] = acts!.map((v) => v.toJson()).toList();
    }
    if (ceremonies != null) {
      data['ceremonies'] = ceremonies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Charcters {
  String? name;
  String? id;
  String? assetName;

  Charcters({this.name, this.id, this.assetName});

  Charcters.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}

class Maps {
  String? name;
  String? id;
  String? assetName;
  String? assetPath;
  String? image;

  Maps({this.name, this.id, this.assetName, this.assetPath, this.image});

  Maps.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
    assetPath = json['assetPath'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    data['assetPath'] = assetPath;
    data['image'] = image;
    return data;
  }
}

class Acts {
  String? id;
  String? parentId;
  String? type;
  String? name;
  bool? isActive;

  Acts({this.id, this.parentId, this.type, this.name, this.isActive});

  Acts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parentId'];
    type = json['type'];
    name = json['name'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parentId'] = parentId;
    data['type'] = type;
    data['name'] = name;
    data['isActive'] = isActive;
    return data;
  }
}

class Chromas {
  String? name;
  String? id;
  String? assetName;

  Chromas({this.name, this.id, this.assetName});

  Chromas.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}

class Skins {
  String? name;
  String? id;
  String? assetName;

  Skins({this.name, this.id, this.assetName});

  Skins.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}

class SkinLevels {
  String? name;
  String? id;
  String? assetName;

  SkinLevels({this.name, this.id, this.assetName});

  SkinLevels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}

class Equips {
  String? name;
  String? id;
  String? assetName;

  Equips({this.name, this.id, this.assetName});

  Equips.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}

class GameModes {
  String? name;
  String? id;
  String? assetName;
  String? assetPath;

  GameModes({this.name, this.id, this.assetName, this.assetPath});

  GameModes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    data['assetPath'] = assetPath;
    return data;
  }
}

class Sprays {
  String? name;
  String? id;
  String? assetName;

  Sprays({this.name, this.id, this.assetName});

  Sprays.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}

class SprayLevels {
  String? name;
  String? id;
  String? assetName;

  SprayLevels({this.name, this.id, this.assetName});

  SprayLevels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}

class Charms {
  String? name;
  String? id;
  String? assetName;

  Charms({this.name, this.id, this.assetName});

  Charms.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}

class CharmLevels {
  String? name;
  String? id;
  String? assetName;

  CharmLevels({this.name, this.id, this.assetName});

  CharmLevels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}

class PlayerCards {
  String? name;
  String? id;
  String? assetName;

  PlayerCards({this.name, this.id, this.assetName});

  PlayerCards.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}

class PlayerTitles {
  String? name;
  String? id;
  String? assetName;

  PlayerTitles({this.name, this.id, this.assetName});

  PlayerTitles.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}

class Ceremonies {
  String? name;
  String? id;
  String? assetName;

  Ceremonies({this.name, this.id, this.assetName});

  Ceremonies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    assetName = json['assetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['assetName'] = assetName;
    return data;
  }
}
