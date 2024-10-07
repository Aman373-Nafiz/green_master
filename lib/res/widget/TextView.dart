import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
   String? label;
   Color? color;
   double? fontSize;
   FontWeight? weight;

  TextView({ required this.label , required this.color, required this.fontSize, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(label!,style: TextStyle(fontSize:fontSize,color: color,fontWeight: weight));
  }
}
