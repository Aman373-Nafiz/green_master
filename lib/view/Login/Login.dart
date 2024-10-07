import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:green_master/res/colors/Appcolor.dart';
import 'package:green_master/res/texts/map.dart';
import 'package:green_master/view/Registration/Registration1.dart';
import 'package:green_master/res/widget/Button.dart';
import 'package:green_master/res/widget/TextForm.dart';
import 'package:green_master/res/widget/TextView.dart';

import '../../repository/Authentication.dart';
import '../Redirect Screens/Redirect_from_Login.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;

    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage2());
  }
}

class LoginPage2 extends StatelessWidget {
  LoginPage2({super.key});

  @override
  final Auth auth = Auth();
  Widget build(BuildContext context) {
    final phone = TextEditingController();
    final pass = TextEditingController();
    var passwordVisible = false;
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return Scaffold(
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
              top: 80,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.084,
                  ),
                  TextView(
                    label: textmap.login.title,
                    fontSize: 24,
                    color: TitleTextColor,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'images/GreenMaster_Logo.png',
                    height: 180,
                    width: 210,
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  TextForm(
                    hintText: 'Enter Phone Number',
                    h: h,
                    w: w,
                    Icons: Icon(Icons.phone),
                    controller: phone,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  TextForm(
                    hintText: 'Enter Password',
                    h: h,
                    w: w,
                    Icons: Icon(Icons.visibility_off),
                    controller: pass,
                  ),

                  /*Container(
                      height: 50,
                      width: (w > 500) ? h / 2 : h / 2.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12),
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: suffixIcon: IconButton(
                     icon: Icon(passwordVisible
                         ? Icons.visibility
                         : Icons.visibility_off),
                     onPressed: () {
                       setState(
                         () {
                           passwordVisible = !passwordVisible;
                         },
                       );
                     },
                   ),,
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 12, bottom: 12),
                          hintText: 'Password',

                          // Set the border to none to remove the outline border
                          border: InputBorder.none,
                        ),
                      ),
                    ),*/
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: h * 0.028),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: false, onChanged: (bool? newValue) {}),
                            /*Text(
                                'Remember me',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),*/
                            TextView(
                                label: 'Remember me',
                                color: Colors.black,
                                fontSize: 12,
                                weight: FontWeight.w500)
                          ],
                        ),
                        SizedBox(
                          width: h * 0.088,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.089,
                  ),
                  GestureDetector(
                      onTap: () async {
                        var check = await auth.Login(phone.text, pass.text);
                        if (check) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_to_Homepage()));
                        } else {
                          print('Couldnt Logged in');
                        }
                      },
                      child: Button(title: 'Login', h: h, w: w)),
                  SizedBox(
                    height: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserType_Reg_Page()));
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have  a account ?',
                            style: TextStyle(
                              color:
                                  Colors.black.withOpacity(0.8700000047683716),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Register',
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
        ));
  }
}
