import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teacher_app/view/new.dart';

class Temp {
  static double lat = 19.0296;
  static double lng = 73.0166;
}

//37.42796133580664
//-122.085749655962
//zoom - 14.4746
class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(Temp.lat, Temp.lng),
    zoom: 20,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(Temp.lat, Temp.lng),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final Marker _marker1 = Marker(
    markerId: MarkerId('marker1'),
    infoWindow: InfoWindow(title: 'marker1'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(Temp.lat, Temp.lng),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("map"),
      ),
      body: GoogleMap(
        markers: {_marker1},
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
