class MapModel {
  String? title;
  String? image;
  String? desc;
  String? location;
  String? spike;

  MapModel({
    required this.title,
    required this.image,
    required this.desc,
    required this.location,
    required this.spike,
  });
}

List<MapModel> listMap = [
  MapModel(
    title: "The Range",
    image: "assets/maps/range.webp",
    desc: "desc",
    location: "Venice, Italy, Alpha Earth",
    spike: "Test",
  ),
  MapModel(
    title: "Bind",
    image: "assets/maps/bind.webp",
    desc: "desc",
    location: "Rabat, Morocco, Alpha Earth",
    spike: "A-B",
  ),
  MapModel(
    title: "Haven",
    image: "assets/maps/haven.webp",
    desc: "desc",
    location: "Thimphu, Bhutan, Alpha Earth",
    spike: "A-B-C",
  ),
  MapModel(
    title: "Split",
    image: "assets/maps/split.webp",
    desc: "desc",
    location: "Tokyo, Japan, Alpha Earth",
    spike: "A-B",
  ),
  MapModel(
    title: "Ascent",
    image: "assets/maps/ascent.webp",
    desc: "desc",
    location: "Venice, Italy, Alpha Earth",
    spike: "A-B",
  ),
  MapModel(
    title: "Icebox",
    image: "assets/maps/icebox.webp",
    desc: "desc",
    location: "Bennett Island, Russia, Alpha Earth",
    spike: "A-B",
  ),
  MapModel(
    title: "Breeze",
    image: "assets/maps/breeze.webp",
    desc: "desc",
    location: "Bermuda Triangle, Atlantic Ocean, Alpha Earth",
    spike: "A-B",
  ),
  MapModel(
    title: "Fracture",
    image: "assets/maps/fracture.webp",
    desc: "desc",
    location: "Santa Fe, New Mexico, USA, Alpha Earth",
    spike: "A-B",
  ),
  MapModel(
    title: "Pearl",
    image: "assets/maps/pearl.webp",
    desc: "desc",
    location: " Lisbon, Portugal, Omega Earth",
    spike: "A-B",
  ),
];
