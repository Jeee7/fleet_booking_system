import 'package:fleet_booking_system/constants/dummy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class VehicleMapPage extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleMapPage({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lokasi ${vehicle.name}")),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(vehicle.latitude, vehicle.longitude),
          zoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://cartodb-basemaps-a.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png',
          ),

          MarkerLayer(
            markers: [
              Marker(
                width: 80,
                height: 80,
                point: LatLng(vehicle.latitude, vehicle.longitude),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
