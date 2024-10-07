import 'dart:async';

import 'package:flutter/material.dart';
import 'package:green_master/view/Redirect%20Screens/Redirect_from_Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Login_to_Homepage())));
  }

  var json = {
    2: 'S',
    3: 'S',
    4: 'S',
    5: 'S',
    6: 'S',
    7: 'S',
    8: 'BS',
    9: 'BS',
    10: 'BS'
  };
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    return MaterialApp(debugShowCheckedModeBanner: false, home: SS());
  }
}

class SS extends StatefulWidget {
  const SS({super.key});

  @override
  State<SS> createState() => _SSState();
}

class _SSState extends State<SS> {
  @override
   void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Login_to_Homepage())));
  }
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.25,
            ),
            Image.asset(
              'images/GreenMaster_Logo.png',
              height: h / 2.5,
              width: h / 3,
            ),
            Text(
              'Green Cycle',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
