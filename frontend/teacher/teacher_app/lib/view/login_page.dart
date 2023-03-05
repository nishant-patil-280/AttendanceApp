import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teacher_app/view/teacher_home_page.dart';
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

void checkLogin(String username, String password) async {
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
    Response resp = await dio.post(
      options.baseUrl + "/login",
      data: {"username": username, "password": password},
    );
    print(resp);
  } catch (e) {
    print("Exception: $e");
  }

  dio.close();
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: height * .35,
              width: double.infinity,
              // color: Colors.blue[400], use color directly in box decoration
              decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Stack(
                children: <Widget>[
                  // Image.asset(
                  //   'assets/images/tick.png',
                  //   height: MediaQuery.of(context).size.height * .25,
                  // ),
                  Positioned(
                    left: 25,
                    bottom: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.white, fontSize: width * .15),
                        ),
                        Text(
                          'Teacher',
                          style: TextStyle(
                              color: Colors.white, fontSize: width * .15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: height * .10,
            ),
            LoginFormWidget(
              height: height,
            ),
          ],
        ),
      ),
    ));
  }
}

class LoginFormWidget extends StatefulWidget {
  final double height;
  const LoginFormWidget({super.key, required this.height});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _userEmailController = TextEditingController();
  final _userPasswordController = TextEditingController(text: 'password1234');
  final _passwordFocusNode = FocusNode();
  final bool _isPasswordVisible = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordFocusNode.dispose();
  }

  ///save form
  _saveForm() {
    _formKey.currentState?.save();
  }

  // Future<String> value = test();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextFormField(
              controller: _userEmailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              validator: ((value) {
                bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                if (!emailValid) {
                  return "Enter valid email address";
                } else {
                  return null;
                }
              }),
              onSaved: ((newValue) {}),
              decoration: InputDecoration(label: Text('Enter your Login id')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextFormField(
              controller: _userPasswordController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              focusNode: _passwordFocusNode,
              validator: (value) {
                if (value!.length < 5) {
                  return "Enter a valid password";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(label: Text('Enter your password')),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          ElevatedButton(
            onPressed: () {
              checkLogin(
                  _userEmailController.text, _userPasswordController.text);
              // test();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherHomePage()),
              );
            },
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * .35,
                    MediaQuery.of(context).size.height * .05),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
          )
        ],
      ),
    );
  }
}
