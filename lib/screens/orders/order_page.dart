import 'package:flutter/material.dart';
import 'package:fleet_booking_system/model/dummy_profile_model.dart';
import 'package:fleet_booking_system/model/dummy_vehicle_model.dart';

class OrderPage extends StatefulWidget {
  final Vehicle? vehicle;
  final Profile? user;

  const OrderPage({super.key, this.vehicle, this.user});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Simulasi loading 1.5 detik
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isOrderActive = widget.vehicle != null && widget.user != null;

    return Scaffold(
      appBar: AppBar(title: const Text('Order Summary')),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16),
                child:
                    isOrderActive
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Order Details',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // 👤 User Info
                            Text('Name: ${widget.user!.name}'),
                            Text('Email: ${widget.user!.email}'),
                            Text('Phone: ${widget.user!.phone}'),

                            const Divider(height: 32),

                            // 🚗 Vehicle Info
                            Text('Vehicle: ${widget.vehicle!.name}'),
                            Text('Type: ${widget.vehicle!.type}'),
                            Text(
                              'License Plate: ${widget.vehicle!.licensePlate}',
                            ),

                            // 📍 Location
                            Text(
                              'Current Location: ${widget.vehicle!.latitude}, ${widget.vehicle!.longitude}',
                            ),

                            const SizedBox(height: 24),

                            // 🕒 Order Time
                            Text(
                              'Order Time: ${DateTime.now().toLocal().toString().split('.')[0]}',
                            ),

                            const Spacer(),

                            // 🔘 Confirm Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Order Confirmed!"),
                                    ),
                                  );
                                },
                                child: const Text("Confirm Order"),
                              ),
                            ),
                          ],
                        )
                        : const Center(
                          child: Text(
                            "No Order Active",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
              ),
    );
  }
}
