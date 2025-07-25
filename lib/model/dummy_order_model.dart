import 'package:fleet_booking_system/model/dummy_profile_model.dart';
import 'package:fleet_booking_system/model/dummy_vehicle_model.dart';

class OrderModel {
  final Profile user;
  final Vehicle vehicle;
  final DateTime orderTime;
  final String? status;

  OrderModel({
    required this.user,
    required this.vehicle,
    required this.orderTime,
    this.status,
  });
}
