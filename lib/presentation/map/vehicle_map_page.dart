// Show Vehicle on Map UI and BLoC
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/map/vehicle_map_bloc.dart';

class VehicleMapPage extends StatelessWidget {
  const VehicleMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VehicleMapBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Show Vehicle on Map')),
        body: const DummyMapView(),
      ),
    );
  }
}

class DummyMapView extends StatelessWidget {
  const DummyMapView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy vehicle locations
    final vehicleNames = ['Toyota Prius', 'Ford Transit'];
    final vehicleLats = ['37.7749', '37.7849'];
    final vehicleLngs = ['-122.4194', '-122.4094'];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.map, size: 100, color: Colors.blueGrey),
          const SizedBox(height: 20),
          for (int i = 0; i < vehicleNames.length; i++)
            ListTile(
              leading: const Icon(Icons.directions_car),
              title: Text(vehicleNames[i]),
              subtitle: Text('Lat: ${vehicleLats[i]}, Lng: ${vehicleLngs[i]}'),
            ),
          const SizedBox(height: 20),
          const Text('(Map is a placeholder for demo)'),
        ],
      ),
    );
  }
}
