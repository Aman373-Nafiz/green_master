import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:green_master/res/colors/Appcolor.dart';
import 'package:green_master/res/texts/map.dart';
import 'package:green_master/view/Login/Login.dart';
import 'package:green_master/view/Registration/Registration2.dart';
import 'package:green_master/res/widget/TextView.dart';
import 'package:green_master/view/Verification/Verification.dart';

import '../../repository/Authentication.dart';

class UserType_Reg_Page extends StatefulWidget {
  const UserType_Reg_Page({super.key});

  @override
  State<UserType_Reg_Page> createState() => _UserType_Reg_PageState();
}

class _UserType_Reg_PageState extends State<UserType_Reg_Page> {
  @override
  var passwordVisible1 = false;
  var passwordVisible2 = false;
  final phone = TextEditingController();
  final pass = TextEditingController();
  final pass_confirm = TextEditingController();
  var currString = '';
  final Auth auth = Auth();
  var l = [
    'Household',
    'Restaurant',
    'Shopping Mall',
    'Office',
    'Institution',
    'Factory',
    'Vangari',
    'Recycling Company',
    'Waste Collector'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: BgColor,
          body: Stack(
            children: [
              Positioned(
                left: -48,
                top: -52,
                child: Image.asset('images/circle.png',
                    height: h * 0.28, width: h * 0.282),
              ),
              Positioned(
                  top: 275,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      TextView(
                          label: textmap.registration1.title,
                          color: TitleTextColor,
                          fontSize: 29,
                          weight: FontWeight.w600),
                      SizedBox(
                        height: 3,
                      ),
                      Text('by creating an account',
                          style: TextStyle(
                              fontSize: 14,
                              color: TitleTextColor,
                              letterSpacing: 0.7,
                              fontWeight: FontWeight.w400)),
                    ],
                  )),
              Positioned(
                top: 45.5,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.082,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: h * 0.1),
                      child: Image.asset(
                        'images/Boat.png',
                        height: 200,
                        width: 230,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.041,
                    ),
                    Container(
                        // height: 58,
                        width: (w > 500) ? h / 2.1 : h / 2.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black12),
                        child: ExpansionTile(
                            children: [
                              ListView(
                                shrinkWrap: true,
                                children: l
                                    .map((e) => ListTile(
                                          onTap: () {
                                            setState(() {
                                              currString = e;
                                            });
                                          },
                                          title: Text(
                                            e,
                                            style: TextStyle(
                                                color: TitleTextColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ))
                                    .toList(),
                              )
                            ],
                            title: Text(currString.isEmpty
                                ? 'Select User Type'
                                : currString))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: (w > 500) ? h / 2 : h / 2.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12),
                      child: TextFormField(
                        controller: phone,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.phone),
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 12, bottom: 12),
                          hintText: 'Enter Phone Number',

                          // Set the border to none to remove the outline border
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: (w > 500) ? h / 2 : h / 2.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12),
                      child: TextFormField(
                        controller: pass,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible1 = !passwordVisible1;
                              });
                            },
                            icon: Icon(passwordVisible1
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 12, bottom: 12),
                          hintText: 'Password',

                          // Set the border to none to remove the outline border
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: (w > 500) ? h / 2 : h / 2.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12),
                      child: TextFormField(
                        controller: pass_confirm,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible2 = !passwordVisible2;
                              });
                            },
                            icon: Icon(passwordVisible2
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 12, bottom: 12),
                          hintText: ' Re - Password',

                          // Set the border to none to remove the outline border
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        var check = await auth.Register1(phone.text, pass.text,
                            pass_confirm.text, currString);

                        if (check) {
                          int code = await auth.sendOTP(phone.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Verification(code: code);
                          }));
                          Fluttertoast.showToast(
                              msg: "Registration is successful",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        } else {
                          print("Problem in registration  ${currString}");
                          Fluttertoast.showToast(
                              msg: "Registration is not successful",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        }
                      },
                      child: Container(
                        height: 50,
                        width: (w > 500) ? h / 2 : h / 2.44,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text('Next',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already a member ?',
                              style: TextStyle(
                                color:
                                    ButtonColor.withOpacity(0.8700000047683716),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: ButtonColor,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: ButtonColor,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
