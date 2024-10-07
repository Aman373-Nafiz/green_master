import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:green_master/res/colors/AppColor.dart';
import 'package:green_master/res/widget/TextView.dart';
import 'package:green_master/view/Login/Login.dart';
import 'package:green_master/view/Seller/pages/page1.dart';
import 'package:green_master/view/Seller/pages/page2.dart';
import 'package:green_master/view/Seller/pages/pages3.dart';

import '../../repository/Authentication.dart';
import '../Registration/Registration1.dart';

class Seller_Home_Screen extends StatefulWidget {
  const Seller_Home_Screen({super.key});

  @override
  State<Seller_Home_Screen> createState() => _Seller_Home_ScreenState();
}

class _Seller_Home_ScreenState extends State<Seller_Home_Screen> {
  int _page = 0;
  final Auth auth = Auth();
  var l = [
    'Settings',
    'Like Us',
    'Share',
    'Contact with Us',
    'About us',
    'Logout',
    'Register'
  ];
  var pages = [Page1(), Page2(), Page3()];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: BgColor,
          appBar: (_page == 2)
              ? AppBar(
                  backgroundColor: BgColor,
                  title: TextView(
                    label: 'Chats',
                    color: TitleTextColor,
                    fontSize: 18,
                    weight: FontWeight.w700,
                  ),
                  centerTitle: true,
                )
              : AppBar(
                  title: TextView(
                    label: 'Green Cycle',
                    color: TitleTextColor,
                    fontSize: 18,
                    weight: FontWeight.w700,
                  ),
                  centerTitle: true,
                  actions: [
                    Row(
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.search,
                            size: 35,
                            color: TitleTextColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.notifications,
                            size: 35,
                            color: TitleTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          body: pages[_page],
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: ButtonColor),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('images/BrokenPhone.jpg'),
                            radius: 30,
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                              ),
                              Icon(
                                Icons.nights_stay,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Anonymous User",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(l[0]),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(l[1]),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(l[2]),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(l[3]),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(l[4]),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(l[5]),
                  onTap: () async {
                    var check = await auth.Logout();
                    if (check) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ),
                      );
                    }
                  },
                ),
                ListTile(
                  title: Text(l[6]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UserType_Reg_Page();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            index: 0,
            height: 72.0,
            items: [
              Icon(
                Icons.home,
                size: 40,
                color: Colors.white,
              ),
              Icon(
                Icons.location_on,
                size: 40,
                color: Colors.white,
              ),
              Icon(
                Icons.message,
                size: 40,
                color: Colors.white,
              ),
            ],
            color: ButtonColor,
            backgroundColor: BgColor,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
