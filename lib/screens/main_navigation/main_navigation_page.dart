import 'package:fleet_booking_system/screens/orders/order_page.dart';
import 'package:flutter/material.dart';
import 'package:fleet_booking_system/constants/color_list.dart';
import 'package:fleet_booking_system/screens/account/profile.dart';
import 'package:fleet_booking_system/screens/login/explorer.dart';
import 'package:fleet_booking_system/screens/vehicle/vehicle_page_detail.dart';
import 'package:fleet_booking_system/screens/map/vehicle_map_page.dart';

class MainNavigationPage extends StatefulWidget {
  final int initialIndex;
  const MainNavigationPage({super.key, this.initialIndex = 0});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  late int _selectedIndex;

  static final List<Widget> _pages = <Widget>[
    ExplorePage(),
    VehicleDetailPage(),
    // VehicleMapPage(),
    OrderPage(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          backgroundColor: ColorList.primary,
          selectedItemColor: Colors.white,
          unselectedItemColor: ColorList.primaryLight,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_rounded),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car),
              label: 'Vehicle',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
