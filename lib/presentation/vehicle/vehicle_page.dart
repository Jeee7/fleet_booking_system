// Vehicle Details & Gallery UI and BLoC
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/vehicle/vehicle_bloc.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VehicleBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Vehicle Details & Gallery')),
        body: const VehicleList(),
      ),
    );
  }
}

class VehicleList extends StatelessWidget {
  const VehicleList({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy vehicle data as separate lists
    final vehicleNames = ['Toyota Prius', 'Ford Transit'];
    final vehicleDescs = ['Hybrid, 2018, White', 'Van, 2020, Silver'];
    final vehicleImages = [
      [
        'https://images.pexels.com/photos/358070/pexels-photo-358070.jpeg',
        'https://images.pexels.com/photos/170782/pexels-photo-170782.jpeg',
      ],
      ['https://images.pexels.com/photos/193993/pexels-photo-193993.jpeg'],
    ];
    return ListView.builder(
      itemCount: vehicleNames.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(12),
          child: ListTile(
            title: Text(vehicleNames[index]),
            subtitle: Text(vehicleDescs[index]),
            onTap:
                () => showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        title: Text(vehicleNames[index]),
                        content: SizedBox(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children:
                                vehicleImages[index]
                                    .map(
                                      (img) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(img, width: 150),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ),
                      ),
                ),
          ),
        );
      },
    );
  }
}
