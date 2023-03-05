import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teacher_app/view/teacher_view_attendance_page.dart';

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
    zoom: 18,
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

  static final Circle _circle1 = Circle(
    circleId: CircleId("1"),
    center: LatLng(Temp.lat, Temp.lng),
    radius: 25,
    fillColor: Colors.redAccent.withOpacity(0.4),
    strokeColor: Colors.redAccent,
    strokeWidth: 3,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("map"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            height: 300,
            width: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: GoogleMap(
                markers: {_marker1},
                circles: {_circle1},
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //alignment: Alignment.centerLeft,
                fixedSize: Size(200, 30),
              ),
              child: Text("Mark Attendance"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewAttendance()),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            width: double.infinity,
            color: Colors.white,
            child: Text("List of students with distance:"),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .30,
            width: double.infinity,
            child: ListView.builder(
                itemCount: 25,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Card(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(('Student 1')),
                        ],
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
