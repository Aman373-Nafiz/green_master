import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:green_master/view/Buyer%20and%20Seller/HomeScreen.dart';
import 'package:green_master/view/Seller/HomeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Register_to_Homepages extends StatefulWidget {
  const Register_to_Homepages({super.key});

  @override
  State<Register_to_Homepages> createState() => _Register_to_HomepagesState();
}

class _Register_to_HomepagesState extends State<Register_to_Homepages> {
  @override
  int roleId = 0;
  bool load = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    getRoleId();
  }

  Future getRoleId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int storedRoleId =
        prefs.getInt('roleId') ?? -1; // Default value -1 if roleId is not found
    setState(() {
      roleId = storedRoleId;
      load = true;
    });
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: (load==false)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (json[roleId] == 'S')
                  ? Seller_Home_Screen()
                  : BS_HomeScreen()),
    );
  }
}
