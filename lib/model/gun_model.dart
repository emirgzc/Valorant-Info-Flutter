class GunModel {
  String? name;
  String? price;
  String? classWeapon;
  String? wallPenet;
  String? capacity;
  String? fireMode;
  String? rateOfFire;
  String? altRateOfFire;
  String? image;
  Map<String, Map<String, String>>? damage;

  GunModel({
    required this.name,
    required this.price,
    required this.classWeapon,
    required this.wallPenet,
    required this.capacity,
    required this.fireMode,
    required this.rateOfFire,
    this.altRateOfFire,
    required this.damage,
    required this.image,
  });
}

List<GunModel> gunList = [
  GunModel(
    name: "Classic",
    price: "Free Default",
    classWeapon: "Sidearms",
    wallPenet: "Low",
    capacity: "12",
    fireMode: "Semi-automatic",
    rateOfFire: "6.75 rounds/sec",
    altRateOfFire: "2.22 rounds/sec",
    image: "assets/guns/classic.webp",
    damage: {
      "0-30m": {
        "Head": "78",
        "Body": "26",
        "Leg": "22",
      },
      "30-50m": {
        "Head": "66",
        "Body": "22",
        "Leg": "18",
      },
    },
  ),
  GunModel(
    name: "Shorty",
    price: "200",
    classWeapon: "Sidearms",
    wallPenet: "Low",
    capacity: "2",
    fireMode: "Semi-automatic",
    rateOfFire: " 3.3 rounds/second",
    image: "assets/guns/shorty.webp",
    damage: {
      "0-9m": {
        "Head": "36",
        "Body": "12",
        "Leg": "10",
      },
      "9-15m": {
        "Head": "24",
        "Body": "8",
        "Leg": "6",
      },
      "15m+": {
        "Head": "9",
        "Body": "3",
        "Leg": "2",
      },
    },
  ),
  GunModel(
    name: "Frenzy",
    price: "400",
    classWeapon: "Sidearms",
    wallPenet: "Medium",
    capacity: "15",
    fireMode: "Semi-automatic",
    rateOfFire: "6.75 rounds/sec",
    image: "assets/guns/frenzy.webp",
    damage: {
      "0-30m": {
        "Head": "105",
        "Body": "30",
        "Leg": "26",
      },
      "30-50m": {
        "Head": "88",
        "Body": "25",
        "Leg": "21",
      },
    },
  ),
  GunModel(
    name: "Sheriff",
    price: "800",
    classWeapon: "Sidearms",
    wallPenet: "High",
    capacity: "6",
    fireMode: "Semi-automatic",
    rateOfFire: "4 rounds/second",
    image: "assets/guns/sheriff.webp",
    damage: {
      "0-30m": {
        "Head": "160",
        "Body": "55",
        "Leg": "57",
      },
      "30-50m": {
        "Head": "145",
        "Body": "50",
        "Leg": "43",
      },
    },
  ),
  GunModel(
    name: "Stinger",
    price: "1000",
    classWeapon: "SMGs",
    wallPenet: "Low",
    capacity: "20",
    fireMode: "Semi-automatic",
    rateOfFire: "18 rounds/second",
    altRateOfFire: "4 rounds/second",
    image: "assets/guns/stinger.webp",
    damage: {
      "0-20m": {
        "Head": "67",
        "Body": "27",
        "Leg": "23",
      },
      "20-50m": {
        "Head": "62",
        "Body": "25",
        "Leg": "21",
      },
    },
  ),
  GunModel(
    name: "Spectre",
    price: "1600",
    classWeapon: "SMGs",
    wallPenet: "Medium",
    capacity: "30",
    fireMode: "Semi-automatic",
    rateOfFire: "13.33 rounds/second",
    altRateOfFire: "12 rounds/second",
    image: "assets/guns/spectre.webp",
    damage: {
      "0-20m": {
        "Head": "78",
        "Body": "26",
        "Leg": "22",
      },
      "20-50m": {
        "Head": "66",
        "Body": "22",
        "Leg": "18",
      },
    },
  ),
  GunModel(
    name: "Bucky",
    price: "900",
    classWeapon: "Shotguns",
    wallPenet: "Low",
    capacity: "5",
    fireMode: "Semi-automatic",
    rateOfFire: "1.1 rounds/second",
    altRateOfFire: "1.1 rounds/second",
    image: "assets/guns/bucky.webp",
    damage: {
      "0-8m": {
        "Head": "44",
        "Body": "22",
        "Leg": "19",
      },
      "8-12m": {
        "Head": "34",
        "Body": "17",
        "Leg": "14",
      },
      "12-50m": {
        "Head": "18",
        "Body": "9",
        "Leg": "8",
      },
    },
  ),
  GunModel(
    name: "Judge",
    price: "1500",
    classWeapon: "Shotguns",
    wallPenet: "Medium",
    capacity: "7",
    fireMode: "Semi-automatic",
    rateOfFire: "3.5 rounds/second",
    image: "assets/guns/judge.webp",
    damage: {
      "0-8m": {
        "Head": "34",
        "Body": "17",
        "Leg": "14",
      },
      "8-12m": {
        "Head": "26",
        "Body": "13",
        "Leg": "11",
      },
      "12-50m": {
        "Head": "20",
        "Body": "10",
        "Leg": "9",
      },
    },
  ),
  GunModel(
    name: "Bulldog ",
    price: "2100",
    classWeapon: "Rifles",
    wallPenet: "Medium",
    capacity: "24",
    fireMode: "Semi-automatic",
    rateOfFire: "9.15 rounds/second",
    altRateOfFire: "4 rounds/second",
    image: "assets/guns/bulldog.webp",
    damage: {
      "0-50m": {
        "Head": "116",
        "Body": "35",
        "Leg": "30",
      },
    },
  ),
  GunModel(
    name: "Guardian",
    price: "2500",
    classWeapon: "Rifles",
    wallPenet: "Medium",
    capacity: "12",
    fireMode: "Semi-automatic",
    rateOfFire: "6.5 rounds/second",
    altRateOfFire: "4.75 rounds/second",
    image: "assets/guns/guardian.webp",
    damage: {
      "0-50m": {
        "Head": "195",
        "Body": "65",
        "Leg": "49",
      },
    },
  ),
  GunModel(
    name: "Phantom",
    price: "2900",
    classWeapon: "Rifles",
    wallPenet: "Medium",
    capacity: "30",
    fireMode: "Semi-automatic",
    rateOfFire: "11 rounds/second",
    altRateOfFire: "9.9 rounds/second",
    image: "assets/guns/phantom.webp",
    damage: {
      "0-15m": {
        "Head": "156",
        "Body": "39",
        "Leg": "33",
      },
      "15-30m": {
        "Head": "140",
        "Body": "35",
        "Leg": "30",
      },
      "30-50m": {
        "Head": "124",
        "Body": "31",
        "Leg": "24",
      },
    },
  ),
  GunModel(
    name: "Vandal",
    price: "2900",
    classWeapon: "Rifles",
    wallPenet: "Medium",
    capacity: "25",
    fireMode: "Semi-automatic",
    rateOfFire: "9.25 rounds/second",
    altRateOfFire: "8.32 rounds/second",
    image: "assets/guns/vandal.webp",
    damage: {
      "0-50m": {
        "Head": "156",
        "Body": "39",
        "Leg": "33",
      },
    },
  ),
  GunModel(
    name: "Marshal",
    price: "1100",
    classWeapon: "Sniper",
    wallPenet: "Medium",
    capacity: "5",
    fireMode: "Semi-automatic",
    rateOfFire: "1.5 rounds/second",
    altRateOfFire: "1.2 rounds/second",
    image: "assets/guns/marshal.webp",
    damage: {
      "0-50m": {
        "Head": "202",
        "Body": "101",
        "Leg": "85",
      },
    },
  ),
  GunModel(
    name: "Operator",
    price: "4500",
    classWeapon: "Sniper",
    wallPenet: "High",
    capacity: "5",
    fireMode: "Semi-automatic",
    rateOfFire: "0.75 rounds/second",
    image: "assets/guns/operator.webp",
    damage: {
      "0-50m": {
        "Head": "255",
        "Body": "150",
        "Leg": "127",
      },
    },
  ),
  GunModel(
    name: "Ares",
    price: "1600",
    classWeapon: "Heavy",
    wallPenet: "High",
    capacity: "50",
    fireMode: "Semi-automatic",
    rateOfFire: "10 -> 13 rounds/second",
    altRateOfFire: "10 -> 13 rounds/second",
    image: "assets/guns/ares.webp",
    damage: {
      "0-30m": {
        "Head": "72",
        "Body": "30",
        "Leg": "25",
      },
      "30-50m": {
        "Head": "67",
        "Body": "28",
        "Leg": "23",
      },
    },
  ),
  GunModel(
    name: "Odin",
    price: "3200",
    classWeapon: "Heavy",
    wallPenet: "High",
    capacity: "100",
    fireMode: "Semi-automatic",
    rateOfFire: "12 -> 15.6 rounds/second",
    altRateOfFire: "15.6 rounds/second",
    image: "assets/guns/odin.webp",
    damage: {
      "0-30m": {
        "Head": "95",
        "Body": "38",
        "Leg": "32",
      },
      "30-50m": {
        "Head": "77",
        "Body": "31",
        "Leg": "26",
      },
    },
  )
];
