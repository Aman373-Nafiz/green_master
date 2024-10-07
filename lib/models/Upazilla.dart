import 'dart:convert';
import 'package:flutter/material.dart';

class Upazila {
  bool success;
  String message;
  List<Datum> data;

  Upazila({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Upazila.fromJson(Map<String, dynamic> json) {
    return Upazila(
      success: json['success'],
      message: json['message'],
      data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  int id;
  int districtId;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;
  Districtt district;

  Datum({
    required this.id,
    required this.districtId,
    required this.name,
     this.createdAt,
     this.updatedAt,
    required this.district,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      districtId: json['district_id'],
      name: json['name'],
      createdAt: null, //parseDateString(json['created_at']),
      updatedAt:null,  //parseDateString(json['updated_at']),
      district: Districtt.fromJson(json['district']),
    );
  }

  static DateTime parseDateString(String dateString) {
    // Split the date string to separate date and time parts
    List<String> parts = dateString.split('T');
    String datePart = parts[0];
    String timePart = parts[1].substring(0, parts[1].indexOf('.'));

    // Split the date part to extract year, month, and day
    List<String> dateParts = datePart.split('-');
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);

    // Split the time part to extract hour, minute, and second
    List<String> timeParts = timePart.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    int second = int.parse(timeParts[2]);

    // Create a DateTime object
    return DateTime(year, month, day, hour, minute, second);
  }
}

class Districtt {
  int id;
  int divisionId;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;

  Districtt({
    required this.id,
    required this.divisionId,
    required this.name,
     this.createdAt,
     this.updatedAt,
  });

  factory Districtt.fromJson(Map<String, dynamic> json) {
    return Districtt(
      id: json['id'],
      divisionId: json['division_id'],
      name: json['name'],
      createdAt: null, //Datum.parseDateString(json['created_at']),
      updatedAt: null,  //Datum.parseDateString(json['updated_at']),
    );
  }
}
