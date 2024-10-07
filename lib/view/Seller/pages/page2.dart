import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:green_master/res/colors/AppColor.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return Container(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.026,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.sort,
                          size: 26,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Filter',
                      style: TextStyle(
                          color: TitleTextColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Expanded(
                  child: Container(
                child: GridView.count(
                  crossAxisCount: 2, // Number of columns in the grid
                  mainAxisSpacing:
                      2.0, // Vertical space between each row of items
                  crossAxisSpacing:
                      12.0, // Horizontal space between each column of items
                  children: List.generate(1, (index) {
                    return Column(
                      children: [
                        Container(
                          width: 157,
                          height: 192,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 157,
                                  height: 192,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 20,
                                        offset: Offset(6, 7),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 132,
                                child: Text(
                                  'Faizul Bitto',
                                  style: TextStyle(
                                    color: Color(0xFF1E1F2E),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 156,
                                child: Container(
                                  width: 157,
                                  height: 36,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF101720),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 20,
                                        offset: Offset(6, 7),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 105,
                                top: 161,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('images/Chat Message.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 21,
                                top: 161,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/Call.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 19,
                                top: 10,
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://picsum.photos/120/120"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: OvalBorder(
                                      side: BorderSide(
                                          width: 1, color: Colors.white),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ))
            ],
          ),
        );
  }
}
