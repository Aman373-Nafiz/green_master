import 'package:green_master/models/Roles.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/District.dart';
import '../models/Divisons.dart';
import '../models/Upazilla.dart';

class ApiService {
  var baseURL = 'http://10.0.2.2:8000';
  Future<Divisons> fetchDivisions() async {
    final response = await http.get(Uri.parse('${baseURL}/api/divisions'));

    if (response.statusCode == 200) {
      return Divisons.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load divisions');
    }
  }

  Future<District> fetchDistrict() async {
    final response = await http.get(Uri.parse('${baseURL}/api/districts'));

    if (response.statusCode == 200) {
      return District.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load divisions');
    }
  }
Future<Upazila>fetchUpazila() async{
  final response = await http.get(Uri.parse('${baseURL}/api/upazilas'));

    if (response.statusCode == 200) {
      return Upazila.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load divisions');
    }
}
    Future<Roless> fetchRoles() async {
    final response = await http.get(Uri.parse('${baseURL}/api/roles'));

    if (response.statusCode == 200) {
      return Roless.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load all roles');
    }
  }
}
