import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:green_master/view/Buyer%20and%20Seller/HomeScreen.dart';
import 'package:green_master/view/Login/Login.dart';
import 'package:green_master/view/Seller/HomeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login_to_Homepage extends StatefulWidget {
  const Login_to_Homepage({super.key});

  @override
  State<Login_to_Homepage> createState() => _Login_to_HomepageState();
}

class _Login_to_HomepageState extends State<Login_to_Homepage> {
  @override
  late int roleId;
  late String tokenn;
  bool load = false;
  bool load1 = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    roleId = 0;
    tokenn = '';
    getToken_and_RoleId();
  }

  Future getToken_and_RoleId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences loggedin = await SharedPreferences.getInstance();
    int storedRoleId = prefs.getInt('roleId') ?? -1;
    String storedToken = loggedin.getString('token') ?? '';
    setState(() {
      roleId = storedRoleId;
      tokenn = storedToken;
    
      
          load = true;
        
      
  
    });
    print(tokenn);
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
          body: (load == false)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (tokenn.isEmpty)
                  ? LoginPage()
                  : (json[roleId] == 'S')
                      ? Seller_Home_Screen()
                      : BS_HomeScreen()),
    );
  }
}
