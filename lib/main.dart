import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController _mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  final LatLng _myHome = const LatLng(-7.1433472, 112.6124914);

  final Marker _myHomeMark = Marker(
      markerId: MarkerId('My Home'), position: LatLng(-7.1433472, 112.6124914));

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Omahku'),
          backgroundColor: Colors.greenAccent,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _myHome,
            zoom: 11.0,
          ),
          markers: {
            _myHomeMark,
          },
        ),
      ),
    );
  }
}
