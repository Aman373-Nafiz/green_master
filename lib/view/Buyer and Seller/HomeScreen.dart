import 'package:flutter/material.dart';
import 'package:green_master/res/colors/AppColor.dart';
import 'package:green_master/res/widget/TextView.dart';
import 'package:green_master/view/Buyer%20and%20Seller/pages/page1.dart';
import 'package:green_master/view/Buyer%20and%20Seller/pages/page2.dart';

import '../../repository/Authentication.dart';
import '../Login/Login.dart';

class BS_HomeScreen extends StatelessWidget {
  const BS_HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarScreen(),
    );
  }
}

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  final Auth auth = Auth();
  var l = [
    'Settings',
    'Like Us',
    'Share',
    'Contract with Us',
    'About us',
    'Logout'
  ];
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
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

                      //child: Image.asset('assets/MyPic.jpg'),

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
                        )
                      ],
                    )
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
                          fontWeight: FontWeight.bold),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return LoginPage();
                        })));
                      }
                    },
                  ),
                
                ],
              ),
            ),
        appBar: AppBar(
          backgroundColor: ButtonColor ,
          bottom: TabBar(indicatorColor: BgColor,tabs: [
            Tab(
              child: TextView(
                  label: 'My Post',
                  color: BgColor,
                  fontSize: 17,
                  weight: FontWeight.w600),
            ),
            Tab(
              child: TextView(
                  label: 'Buy',
                  color: BgColor,
                  fontSize: 17,
                  weight: FontWeight.w600),
            ),

          ]),
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
                )
              ],
            ),
          ],
        ),
        body: TabBarView(children: [Page1(),Page2()]),
      ),
    );
  }
}
