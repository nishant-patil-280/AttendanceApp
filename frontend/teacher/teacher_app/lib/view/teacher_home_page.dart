import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teacher_app/view/teacher_map_page.dart';
import 'package:teacher_app/view/timetable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:teacher_app/view/about.dart';
import 'dart:convert';

import 'package:dio/dio.dart';

void test() async {
  BaseOptions options =
      BaseOptions(baseUrl: "http://192.168.0.104:3000", headers: {
    HttpHeaders.acceptHeader: "json/application/json",
    HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
  }
          // connectTimeout: 1000,
          // receiveTimeout: 3000,
          );
  Dio dio = Dio(options);
  try {
    Response resp = await dio.get(
      options.baseUrl + "/test",
    );
    print(resp.data);
    var info = resp.data;
  } catch (e) {
    print("Exception: $e");
  }
  dio.close();
}

void getLocation() async {
  await Geolocator.checkPermission();
  await Geolocator.requestPermission();
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  print(position);

  BaseOptions options =
      BaseOptions(baseUrl: "http://192.168.74.25:3000", headers: {
    HttpHeaders.acceptHeader: "json/application/json",
    HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
  }
          // connectTimeout: 1000,
          // receiveTimeout: 3000,
          );
  Dio dio = Dio(options);
  try {
    Response resp =
        await dio.post(options.baseUrl + "/location", data: {"data": position});
    print(resp.data);
    var info = resp.data;
  } catch (e) {
    print("Exception: $e");
  }
  dio.close();
}

class TeacherHomePage extends StatefulWidget {
  //final Future<String> value;
  const TeacherHomePage({Key? key}) : super(key: key);

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  bool light0 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teacher Login')),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(18),
                width: MediaQuery.of(context).size.width * .90,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                height: 75,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text(
                          'Give Location Access',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Switch(
                            activeColor: Colors.white,
                            value: light0,
                            onChanged: (bool value) {
                              setState(() {
                                getLocation();
                                light0 = value;
                              });
                            },
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .65,
            width: double.infinity,
            child: ListView.builder(
                itemCount: 25,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: const Color.fromRGBO(0, 0, 0, 0.688),
                      elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Lecture name:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text(
                              'Room no:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text(
                              'Timing:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MapSample()),
                                    );
                                  },
                                  child: const Text('Go!'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors
                                          .redAccent, //background color of button
                                      side: const BorderSide(
                                          width: 3,
                                          color: Colors
                                              .brown), //border width and color
                                      elevation: 3, //elevation of button
                                      shape: RoundedRectangleBorder(
                                          //to set border radius to button
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      padding: const EdgeInsets.all(8)),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    getLocation;
                                  },
                                  child: const Text('Cancel'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors
                                          .redAccent, //background color of button
                                      side: const BorderSide(
                                          width: 3,
                                          color: Colors
                                              .brown), //border width and color
                                      elevation: 3, //elevation of button
                                      shape: RoundedRectangleBorder(
                                          //to set border radius to button
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      padding: const EdgeInsets.all(8)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          // Row(children: [
          //   Container(
          //     margin: const EdgeInsets.all(20),
          //     decoration: const BoxDecoration(
          //       color: Colors.blue,
          //       borderRadius: BorderRadius.all(Radius.circular(25)),
          //     ),
          //     height: 200,
          //     child: Column(
          //       children: <Widget>[
          //         const Text(
          //           'data',
          //           style: TextStyle(
          //               fontSize: 25,
          //               color: Colors.white,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ],
          //     ),
          //   ),
          // ]),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Teacher Login'),
            ),
            ListTile(
              title: const Text('View Timetable'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Timetable()),
                );
              },
            ),
            ListTile(
              title: const Text('View Attendance'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const About()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
