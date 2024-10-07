import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String? title;
  double?h;
  double?w;
  Button({required this.title,required this.h,required this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
                        height: 50,
                        width: (w! > 500) ? h! / 2 : h! / 2.44,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(title!,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                      );
  }
}
