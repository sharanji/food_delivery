import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapProvider with ChangeNotifier {
  static LatLng userLocation = const LatLng(0, 0);
  static Location currentLocation = Location();

  static Future<void> fetchLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await currentLocation.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await currentLocation.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await currentLocation.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await currentLocation.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await currentLocation.getLocation();

    userLocation = LatLng(
      locationData.latitude ?? 0.00,
      locationData.longitude ?? 0.00,
    );
  }
}
