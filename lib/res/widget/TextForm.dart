import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  String? hintText;
  double? h;
  double? w;
  Icon? Icons;
  TextEditingController? controller;
  TextForm(
      {required this.hintText,
      required this.h,
      required this.w,
      required this.Icons,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: (w! > 500) ? h! / 2 : h! / 2.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: Icons,
          contentPadding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
          hintText: hintText,

          // Set the border to none to remove the outline border
          border: InputBorder.none,
        ),
      ),
    );
  }
}
