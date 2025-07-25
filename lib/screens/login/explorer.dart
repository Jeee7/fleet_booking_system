import 'package:fleet_booking_system/model/dummy_order_model.dart';
import 'package:fleet_booking_system/model/dummy_profile_model.dart';
import 'package:fleet_booking_system/model/dummy_vehicle_model.dart';
import 'package:fleet_booking_system/screens/main_navigation/main_navigation_page.dart';
import 'package:fleet_booking_system/utils/divider.dart';
import 'package:fleet_booking_system/utils/pop_up.dart';
import 'package:fleet_booking_system/utils/string_formatter.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool _isLoadingVehicles = true;
  bool _isLoadingOrder = true;

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

  // Filtered vehicles list
  List<Vehicle> filteredVehicles = [];

  final dummyUser = Profile(
    id: 1,
    name: 'Jane Doe',
    phone: '1234567890',
    profilePic: 'assets/images/profile/default_profile.png',
    email: 'test@example.com',
  );

  OrderModel? currentOrder;

  final TextEditingController locationController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize filtered vehicles with all vehicles
    filteredVehicles = List.from(vehicles);

    // Add listeners for real-time filtering
    locationController.addListener(_filterVehicles);
    vehicleController.addListener(_filterVehicles);

    _loadData();
  }

  @override
  void dispose() {
    locationController.removeListener(_filterVehicles);
    vehicleController.removeListener(_filterVehicles);
    locationController.dispose();
    vehicleController.dispose();
    super.dispose();
  }

  // Filter vehicles based on search inputs
  void _filterVehicles() {
    setState(() {
      String locationQuery = locationController.text.toLowerCase().trim();
      String vehicleQuery = vehicleController.text.toLowerCase().trim();

      filteredVehicles =
          vehicles.where((vehicle) {
            bool matchesLocation =
                locationQuery.isEmpty ||
                vehicle.location.toLowerCase().contains(locationQuery);

            bool matchesVehicle =
                vehicleQuery.isEmpty ||
                vehicle.name.toLowerCase().contains(vehicleQuery) ||
                vehicle.type.toLowerCase().contains(vehicleQuery);

            return matchesLocation && matchesVehicle;
          }).toList();
    });
  }

  // Clear all filters
  void _clearFilters() {
    setState(() {
      locationController.clear();
      vehicleController.clear();
      filteredVehicles = List.from(vehicles);
    });
  }

  Future<void> _loadData() async {
    await _loadVehicles();
    await _loadCurrentOrder();
  }

  Future<void> _loadVehicles() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isLoadingVehicles = false;
      });
    }
  }

  Future<void> _loadCurrentOrder() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() {
        currentOrder = OrderModel(
          user: dummyUser,
          vehicle: vehicles.first,
          orderTime: DateTime.now(),
        );
        _isLoadingOrder = false;
      });
    }
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
            // Search filters
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      hintText: 'Search location',
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.location_on),
                      suffixIcon:
                          locationController.text.isNotEmpty
                              ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  locationController.clear();
                                },
                              )
                              : null,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: vehicleController,
                    decoration: InputDecoration(
                      hintText: 'Search vehicle',
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.directions_car),
                      suffixIcon:
                          vehicleController.text.isNotEmpty
                              ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  vehicleController.clear();
                                },
                              )
                              : null,
                    ),
                  ),
                ),
              ],
            ),

            // Clear all filters button (only show when there are active filters)
            if (locationController.text.isNotEmpty ||
                vehicleController.text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Found ${filteredVehicles.length} vehicle(s)',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    TextButton(
                      onPressed: _clearFilters,
                      child: const Text(
                        'Clear All',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
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
                _isLoadingVehicles ? _buildVehicleShimmer() : vehicleSection(),
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
                _isLoadingOrder
                    ? _buildOrderShimmer()
                    : orderSection(currentOrder),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleShimmer() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index < 2 ? 16 : 0),
            child: _ShimmerBox(
              width: 160,
              height: 200,
              borderRadius: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ShimmerBox(
                    width: double.infinity,
                    height: 100,
                    borderRadius: 12,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ShimmerBox(width: 120, height: 16, borderRadius: 4),
                        gapHeight(4),
                        _ShimmerBox(width: 80, height: 12, borderRadius: 4),
                        gapHeight(8),
                        _ShimmerBox(width: 100, height: 12, borderRadius: 4),
                        gapHeight(12),
                        _ShimmerBox(width: 90, height: 14, borderRadius: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOrderShimmer() {
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
          _ShimmerBox(width: 100, height: 80, borderRadius: 12),
          gapHeight(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ShimmerBox(
                  width: double.infinity,
                  height: 18,
                  borderRadius: 4,
                ),
                gapHeight(8),
                _ShimmerBox(width: 150, height: 14, borderRadius: 4),
                gapHeight(4),
                _ShimmerBox(width: 120, height: 14, borderRadius: 4),
                gapHeight(4),
                _ShimmerBox(width: 140, height: 14, borderRadius: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget vehicleSection() {
    // Show message when no vehicles match the filter
    if (filteredVehicles.isEmpty) {
      return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 48, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No vehicles found',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your search filters',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filteredVehicles.length,
        itemBuilder: (context, index) {
          final vehicle = filteredVehicles[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index < filteredVehicles.length - 1 ? 16 : 0,
            ),
            child: GestureDetector(
              onTap: () {
                showVehiclePopup(context, vehicle);
              },
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
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

// Custom Shimmer Widget
class _ShimmerBox extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Widget? child;

  const _ShimmerBox({
    required this.width,
    required this.height,
    this.borderRadius = 0,
    this.child,
  });

  @override
  State<_ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<_ShimmerBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment(-1.0 + _animation.value, 0.0),
              end: Alignment(-0.5 + _animation.value, 0.0),
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}
