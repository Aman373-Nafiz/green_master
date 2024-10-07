import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Auth {
  final baseUrl = 'http://10.0.2.2:8000';
  final url = "https://app.api.ryogas.com/pos/send-otp";
  Future<bool> Register1(String phone, String password, String password_confirm,
      String role) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final SharedPreferences phoneNumber = await SharedPreferences.getInstance();
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}/api/register-part1'));
    request.fields.addAll({
      'phone': phone,
      'password': password,
      'password_confirmation': password_confirm,
      'role[]': role
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201 || response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> json = jsonDecode(responseBody);
      List<dynamic> roles = json['data']['user']['roles'];
      phoneNumber.setString('phoneNumber', phone);
      if (roles.isNotEmpty) {
        int roleId = roles[0]['id'];
      } else {
        print("Database failed to load roles");
      }
      //return true;
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
      //return false;
    }
    bool res = await Login(phone, password);
    return res;
    /*if (response.statusCode == 200) {

      return true;
    } else {
      return false;
    }*/
  }

  Future<bool> Register2(var name, var currString1, var currString2,
      var currString3, var area) async {
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}/api/register-part2/2/details'));
    request.fields.addAll({
      'name': name,
      'division_id': currString1,
      'district_id': currString2,
      'upazila_id': currString3,
      'area': area,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return (response.statusCode == 200||response.statusCode==201) ? true : false;
  }

  Future<bool> Login(var phone, var pass) async {
    SharedPreferences loggedin = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}/api/login'));
    request.fields.addAll({
      'phone': phone,
      'password': pass,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);
      Map<String, dynamic> json = jsonDecode(responseBody);
      List<dynamic> roles = json['data']['role'];
      var token = jsonResponse['data']['token'].toString();
      int roleId = roles[0]['id'];
      if (roles.isNotEmpty) {
        prefs.setInt('roleId', roleId);
      } else {
        print("Api failed to load roles data ${roleId}");
      }

      loggedin.setString('token', token);

      return (token.isNotEmpty) ? true : false;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<bool> Logout() async {
    SharedPreferences loggedin = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedToken = loggedin.getString('token') ?? '';
    var token = storedToken;
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
      'Authorization': 'Bearer $storedToken',
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}/api/logout'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      loggedin.remove('token');
      prefs.remove('roleId');
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  var otpcode = 0;
  Future<int> sendOTP(var phoneNumber) async {
    int otpCode = generateOTP();
    final response = http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "data": {
            "attributes": {
              "otp": otpCode,
              "numbers": [phoneNumber.toString()],
              "message-body":
                  "(GreenCycle) - Your OTP verification code  is ${otpCode}"
            }
          }
        }));
    return otpCode;
  }

  int generateOTP() {
    Random random = Random();
    otpcode = random.nextInt(9000) + 1000;
    return otpcode;
  }
}
