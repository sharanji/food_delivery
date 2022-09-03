import 'package:flutter/material.dart';
import 'package:food_delivery/routes.dart';
import 'package:food_delivery/screens/dashboard/app_home_screen.dart';
import 'package:food_delivery/screens/splash_shop/splash_screen.dart';
import 'package:food_delivery/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food delivery',
      theme: theme(),
      themeMode: ThemeMode.light,
      routes: routes,
      // home: const SplashScreen(),
      initialRoute: '/home',
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
