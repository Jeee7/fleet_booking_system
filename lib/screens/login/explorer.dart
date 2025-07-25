import 'package:fleet_booking_system/model/dummy_order_model.dart';
import 'package:fleet_booking_system/model/dummy_profile_model.dart';
import 'package:fleet_booking_system/model/dummy_vehicle_model.dart';
import 'package:fleet_booking_system/screens/main_navigation/main_navigation_page.dart';
import 'package:fleet_booking_system/utils/divider.dart';
import 'package:fleet_booking_system/utils/string_formatter.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<Vehicle> vehicles = [
    Vehicle(
      name: 'Toyota Avanza',
      type: 'MPV',
      image: 'assets/images/vehicles/avanza.jpg',
      location: 'Jakarta',
      price: 250000,
      latitude: -6.175392,
      longitude: 106.827153,
      licensePlate: 'B 1234 ABC',
    ),
    Vehicle(
      name: 'Honda Brio',
      type: 'Hatchback',
      image: 'assets/images/vehicles/brio.jpg',
      location: 'Bandung',
      price: 200000,
      latitude: -6.175392,
      longitude: 106.827153,
      licensePlate: 'B 1234 ABC',
    ),
    Vehicle(
      name: 'Mitsubishi Xpander',
      type: 'SUV',
      image: 'assets/images/vehicles/xpander.jpg',
      location: 'Surabaya',
      price: 500000,
      latitude: -6.175392,
      longitude: 106.827153,
      licensePlate: 'B 1234 ABC',
    ),
    Vehicle(
      name: "Daihatsu Terios",
      type: "SUV",
      image: "assets/images/vehicles/terios.jpg",
      location: "Yogyakarta",
      price: 300000,
      latitude: -6.175392,
      longitude: 106.827153,
      licensePlate: 'B 1234 ABC',
    ),
    Vehicle(
      name: "Daihatsu Ayla",
      type: "Hatchback",
      image: "assets/images/vehicles/ayla.jpg",
      location: "Semarang",
      price: 180000,
      latitude: -6.175392,
      longitude: 106.827153,
      licensePlate: 'B 1234 ABC',
    ),
  ];

  final dummyUser = Profile(
    id: 1,
    name: 'Test User',
    phone: '1234567890',
    profilePic: 'assets/images/profile/default_profile.png',
    email: 'test@example.com',
  );

  // OrderModel? currentOrder = OrderModel(
  //   user: dummyUser,
  //   vehicle: Vehicle(
  //     name: 'Toyota Avanza',
  //     type: 'MPV',
  //     image: 'assets/images/vehicles/avanza.jpg',
  //     location: 'Jakarta',
  //     price: 250000,
  //     latitude: -6.175392,
  //     longitude: 106.827153,
  //     licensePlate: 'B 1234 ABC',
  //   ),
  //   orderTime: DateTime.now(), // ✅ ini dia yang harus ditambah
  // );

  OrderModel? currentOrder;

  final TextEditingController locationController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    currentOrder = OrderModel(
      user: dummyUser,
      vehicle: vehicles.first,
      orderTime: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      hintText: 'Search location...',
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: vehicleController,
                    decoration: InputDecoration(
                      hintText: 'Search vehicle...',
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.directions_car),
                    ),
                  ),
                ),
              ],
            ),
            gapHeight(24),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Vehicles',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const MainNavigationPage(initialIndex: 1),
                          ),
                        );
                      },
                      child: const Text(
                        'See More',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                vehicleSection(),
              ],
            ),
            gapHeight(24),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Current Order',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const MainNavigationPage(initialIndex: 1),
                          ),
                        );
                      },
                      child: const Text(
                        'See More',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                orderSection(currentOrder),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget vehicleSection() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index < vehicles.length - 1 ? 16 : 0,
            ),
            child: GestureDetector(
              onTap: () {
                debugPrint('Tapped on ${vehicle.name}');
              },
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        vehicle.image,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 100,
                            width: double.infinity,
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.directions_car,
                              size: 40,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vehicle.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  vehicle.type,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                    const SizedBox(width: 2),
                                    Expanded(
                                      child: Text(
                                        vehicle.location,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey.shade600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              formatRupiah(vehicle.price),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget orderSection(OrderModel? order) {
    if (order == null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Text('No ongoing order', style: TextStyle(fontSize: 16)),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              order.vehicle.image,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.vehicle.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text('Location: ${order.vehicle.location}'),
                const SizedBox(height: 4),
                Text('Ordered by: ${order.user.name}'),
                const SizedBox(height: 4),
                Text('Price: ${formatRupiah(order.vehicle.price)} / day'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
