import 'dart:convert';
import 'package:flutter/material.dart';
class Divisons {
  bool success;
  String message;
  List<Datum> data;

  Divisons({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Divisons.fromJson(Map<String, dynamic> json) {
    return Divisons(
      success: json['success'],
      message: json['message'],
      data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  int id;
  String name;
  dynamic createdAt;
  dynamic updatedAt;

  Datum({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}