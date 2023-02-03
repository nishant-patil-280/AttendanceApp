// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     // return Center(
//     //   child: Text('fsefesgeg'),
//     // );
//     return SafeArea(
//       child: Scaffold(
//         // appBar: AppBar(
//         //   leading: Icon(Icons.abc),
//         //   title: Text('Student app'),
//         // ),
//         body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 250,
//                   decoration: BoxDecoration(color: Colors.blue),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(16, 25, 16, 5),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50))),
//                           child: Icon(Icons.check),
//                         ),
//                         Text(
//                           'Welcome',
//                           style: TextStyle(fontSize: 25),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ]),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class LoginpageWidget extends StatefulWidget {
  @override
  _LoginpageWidgetState createState() => _LoginpageWidgetState();
}

class _LoginpageWidgetState extends State<LoginpageWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator LoginpageWidget - FRAME

    return Container(
        width: 360,
        height: 800,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: -53,
              left: 0,
              child: Container(
                  width: 360,
                  height: 339,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                    color: Color.fromRGBO(39, 123, 192, 1),
                  ))),
          Positioned(
              top: 197,
              left: 43,
              child: Text(
                'Welcome!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 35,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 17,
              left: 25,
              child: Text(
                '9:46',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 12.80767822265625,
              left: 308.19232177734375,
              child: Container(
                  width: 20.19232940673828,
                  height: 20.19232940673828,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: 2.0192384719848633,
                      left: 0.75721675157547,
                      child: Icon(Icons.abc),
                      //   child: SvgPicture.asset(
                      //   'assets/images/vector.svg',
                      //   semanticsLabel: 'vector'
                      // );
                    ),
                  ]))),
          Positioned(
              top: 12,
              left: 288,
              child: Container(
                  width: 20.19232940673828,
                  height: 20.19232940673828,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: 3.0288522243499756,
                      left: 0.000022384208932635374,
                      child: Icon(Icons.abc),
                    ),
                  ]))),
          Positioned(
              top: 32.25018310546875,
              left: 328.4425964355469,
              child: Container(
                  width: 20.19232940673828,
                  height: 20.19232940673828,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: 5.048062801361084,
                      left: 0.00001567063736729324,
                      child: Icon(Icons.abc),
                    ),
                  ]))),
          Positioned(
              top: 69,
              left: 43,
              child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Logo.png'),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
                  ))),
          Positioned(
            top: 375,
            left: 26,
            child: Icon(Icons.abc),
          ),
          Positioned(
              top: 392,
              left: 89,
              child: Text(
                'user ID',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 20,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
            top: 392,
            left: 49,
            child: Icon(Icons.abc),
          ),
          Positioned(
            top: 473,
            left: 27,
            child: Icon(Icons.abc),
          ),
          Positioned(
              top: 490,
              left: 89,
              child: Text(
                'password',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 20,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
            top: 490,
            left: 49,
            child: Icon(Icons.abc),
          ),
          Positioned(
              top: 707,
              left: 60,
              child: Container(
                  width: 302,
                  height: 92,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Rectangle1.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 48,
              left: 129,
              child: Container(
                  width: 282,
                  height: 274,
                  decoration: BoxDecoration(),
                  child: Stack(children: <Widget>[]))),
          Positioned(
            top: 587,
            left: 133,
            child: Icon(Icons.abc),
          ),
        ]));
  }
}
