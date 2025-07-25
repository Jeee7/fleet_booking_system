import 'package:fleet_booking_system/screens/splash/splash_screen.dart';
import 'package:fleet_booking_system/screens/login/login_page.dart';
import 'package:fleet_booking_system/screens/main_navigation/main_navigation_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fleet Booking System',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/main': (context) => const MainNavigationPage(),
      },
    );
  }
}
