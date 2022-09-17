import 'package:food_delivery/constants.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/providers/map_provider.dart';
import 'package:food_delivery/theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class MapRoute extends StatefulWidget {
  MapRoute(
      // this.sourceLocation,
      this.destination,
      {Key? key})
      : super(key: key);

  // LatLng sourceLocation = const LatLng(12.744429552383842, 77.81675159726294);
  LatLng destination;
  @override
  State<MapRoute> createState() => _MapRouteState();
}

class _MapRouteState extends State<MapRoute> {
  // Variables
  final Completer<GoogleMapController> _controller = Completer();
  // static LatLng sourceLocation = const LatLng(0, 0);
  // static LatLng destination = const LatLng(0.00, 0.00);
  Map<PolylineId, Polyline> polylines = {};
  Uint8List customMarker = Uint8List(0);
  Uint8List userLocationMarker = Uint8List(0);
  double initZoom = 15;
  Location currentLocation = Location();
  late LocationData _locationData;
  LatLng userlatLng = const LatLng(0.0, 0.0);
  double totalDistance = 0.00;
  int hrs = 0;
  int mins = 0;
  double time = 0;
  List<LatLng> polylineCoordinates = [];
  late GoogleMapController mapController;
  // end

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> getPolyPoints() async {
    await fetchLocation();

    if (polylineCoordinates.isNotEmpty) return;
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      ApiKeys.googleMapkey, // Your Google Map Key
      PointLatLng(userlatLng.latitude, userlatLng.longitude),
      PointLatLng(widget.destination.latitude, widget.destination.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      polylineCoordinates = [];
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      PolylineId id = const PolylineId("poly");
      Polyline polyline = Polyline(
        polylineId: id,
        color: AppTheme.nearlyDarkBlue,
        points: polylineCoordinates,
        width: 5,
      );
      polylines[id] = polyline;

      for (var i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += calculateDistance(
            polylineCoordinates[i].latitude,
            polylineCoordinates[i].longitude,
            polylineCoordinates[i + 1].latitude,
            polylineCoordinates[i + 1].longitude);
      }

      totalDistance = double.parse((totalDistance).toStringAsFixed(2));

      // time = distance / speed ;
      time = totalDistance / (0.75);
      hrs = (time / 60).round();
      mins = ((time - hrs) % 60).round();

      customMarker = await getBytesFromAsset(
        'assets/images/bell.png',
        100,
      );
      userLocationMarker = await getBytesFromAsset(
        'assets/images/mylocation.png',
        100,
      );
    }
  }

  Future<void> fetchLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

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
    _locationData = await currentLocation.getLocation();

    userlatLng = LatLng(
      _locationData.latitude ?? 0.00,
      _locationData.longitude ?? 0.00,
    );

    MapProvider.userLocation = userlatLng;
  }

  dynamic locationSubscription;
  void listenTOlocation() {
    locationSubscription =
        currentLocation.onLocationChanged.listen((LocationData position) async {
      LatLng prevLatlong = userlatLng;
      await fetchLocation();
      if (prevLatlong.latitude == userlatLng.latitude &&
          prevLatlong.longitude == userlatLng.longitude) return;

      try {
        mapController.animateCamera(
          CameraUpdate.newLatLngZoom(
              LatLng(userlatLng.latitude, userlatLng.longitude), initZoom),
        );
      } catch (e) {}

      return;
    });
  }

  @override
  void initState() {
    // sourceLocation = widget.sourceLocation;
    // destination = widget.destination;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.done
              ? GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: userlatLng,
                    zoom: initZoom,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                    _controller.complete(controller);
                    listenTOlocation();
                  },
                  onCameraMove: (CameraPosition c) {
                    initZoom = c.zoom;
                  },
                  markers: {
                    // Marker(
                    //   markerId: const MarkerId('Source'),
                    //   position: sourceLocation,
                    //   // icon: BitmapDescriptor.fromBytes(customMarker),
                    // ),
                    Marker(
                      markerId: const MarkerId('destination'),
                      position: widget.destination,
                    ),
                    Marker(
                      markerId: const MarkerId('mylocation'),
                      position: userlatLng,
                      icon: BitmapDescriptor.fromBytes(userLocationMarker),
                    ),
                  },
                  polylines: Set<Polyline>.of(polylines.values),
                  mapType: MapType.normal,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  myLocationEnabled: true,
                  zoomGesturesEnabled: true,
                  padding: const EdgeInsets.all(0),
                  buildingsEnabled: true,
                  cameraTargetBounds: CameraTargetBounds.unbounded,
                  compassEnabled: true,
                  indoorViewEnabled: false,
                  minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  trafficEnabled: false,
                )
              : Center(
                  child: Text(
                    'Finding the best route..!',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
      future: getPolyPoints(),
    );
  }

  @override
  void dispose() {
    locationSubscription.cancel();
    super.dispose();
  }
}
