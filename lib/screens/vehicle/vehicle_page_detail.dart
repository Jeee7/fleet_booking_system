import 'package:fleet_booking_system/screens/vehicle/vehicle_map_static.dart';
import 'package:flutter/material.dart';
import 'package:fleet_booking_system/constants/dummy_model.dart';
import 'package:fleet_booking_system/utils/string_formatter.dart';

class VehicleDetailPage extends StatefulWidget {
  const VehicleDetailPage({super.key});

  @override
  State<VehicleDetailPage> createState() => _VehicleDetailPageState();
}

class _VehicleDetailPageState extends State<VehicleDetailPage> {
  final List<Vehicle> vehicles = [
    Vehicle(
      name: 'Toyota Avanza',
      type: 'MPV',
      image: 'assets/images/vehicles/avanza.jpg',
      location: 'Jakarta',
      price: 250000,
      latitude: -6.175392,
      longitude: 106.827153,
    ),
    Vehicle(
      name: 'Honda Brio',
      type: 'Hatchback',
      image: 'assets/images/vehicles/brio.jpg',
      location: 'Bandung',
      price: 200000,
      latitude: -6.175392,
      longitude: 106.827153,
    ),
    Vehicle(
      name: 'Mitsubishi Xpander',
      type: 'SUV',
      image: 'assets/images/vehicles/xpander.jpg',
      location: 'Surabaya',
      price: 500000,
      latitude: -6.175392,
      longitude: 106.827153,
    ),
    Vehicle(
      name: "Daihatsu Terios",
      type: "SUV",
      image: "assets/images/vehicles/terios.jpg",
      location: "Yogyakarta",
      price: 300000,
      latitude: -6.175392,
      longitude: 106.827153,
    ),
    Vehicle(
      name: "Daihatsu Ayla",
      type: "Hatchback",
      image: "assets/images/vehicles/ayla.jpg",
      location: "Semarang",
      price: 180000,
      latitude: -6.175392,
      longitude: 106.827153,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Semua Kendaraan')),
      body: SingleChildScrollView(
        child: Column(
          children:
              vehicles.map((vehicle) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(16),
                        ),
                        child: Image.asset(
                          vehicle.image,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vehicle.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              vehicle.type,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 12),

                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  vehicle.location,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            Text(
                              formatRupiah(vehicle.price),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),

                            const SizedBox(height: 24),

                            const Text(
                              "Deskripsi Kendaraan",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),

                            const Text(
                              "Kendaraan ini sangat cocok untuk kebutuhan harian, perjalanan bisnis, atau liburan bersama keluarga. Dilengkapi dengan fitur keamanan dan kenyamanan terkini.",
                            ),

                            const SizedBox(height: 16),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) =>
                                              VehicleMapPage(vehicle: vehicle),
                                    ),
                                  );
                                },
                                child: const Text("See Location"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 48, thickness: 1),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
