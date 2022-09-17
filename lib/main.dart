import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:food_delivery/providers/dashboard_provider.dart';
import 'package:food_delivery/providers/theme_provider.dart';
import 'package:food_delivery/routes.dart';
import 'package:food_delivery/screens/splash_shop/splash_screen.dart';
import 'package:food_delivery/theme.dart';
import 'package:provider/provider.dart';

import 'dart:async';
import 'my_isolate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
  runApp(const MyApp());
}

void listenForNotificationData() {
  final backgroundService = FlutterBackgroundService();
  backgroundService.on('update').listen((event) {
    print('received data message in feed: $event');
  }, onError: (e, s) {
    print('error listening for updates: $e, $s');
  }, onDone: () {
    print('background listen closed');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => DashboardProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => ThemeProvider(),
          ),
          StreamProvider<Map<String, dynamic>?>.value(
            initialData: const {'type': 'connection'},
            value: FlutterBackgroundService().on('update'),
          ),
        ],
        builder: (context, child) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Food delivery',
            themeMode: ThemeMode.system,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            routes: routes,
            // home: const SplashScreen(),
            initialRoute: '/home',
          );
        });
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
