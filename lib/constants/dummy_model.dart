class Vehicle {
  final String name;
  final String type;
  final String image;
  final String location;
  final int price;
  final double latitude;
  final double longitude;

  Vehicle({
    required this.name,
    required this.type,
    required this.image,
    required this.location,
    required this.price,
    required this.latitude,
    required this.longitude,
  });
}

final List<Map<String, String>> locations = [
  {"name": "Senayan", "image": "assets/images/locations/senayan.jpg"},
  {"name": "Blok M", "image": "assets/images/locations/blok_m.jpg"},
  {
    "name": "Grand Indonesia",
    "image": "assets/images/locations/grand_indonesia.jpg",
  },
  {"name": "PIK Avenue", "image": "assets/images/locations/pik.jpg"},
  {"name": "Taman Mini", "image": "assets/images/locations/taman_mini.jpg"},
];
