import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:green_master/res/colors/Appcolor.dart';
import 'package:green_master/res/widget/Button.dart';
import 'package:green_master/res/widget/TextForm.dart';
import 'package:green_master/res/widget/TextView.dart';
import 'package:green_master/view/Registration/Registration2.dart';
import 'package:green_master/view/Seller/HomeScreen.dart';
import '../../repository/Authentication.dart';
import '../../res/texts/map.dart';
import 'package:http/http.dart' as http;

class Verification extends StatefulWidget {
  final int code;
   Verification({super.key,required this.code});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  final url = "https://app.api.ryogas.com/pos/send-otp";

  bool verifyOTP(var otpCode,var userInput) {
    print("-------------------- userCode= $userInput, otpcode=$otpCode");

    if (userInput.trim() == otpCode.toString()) {
      // submit signup data

      Fluttertoast.showToast(
          msg: "OTP Verification is successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: "OTP does not match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
      return false;
    }
  }

  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    TextEditingController txt1 = TextEditingController();
    TextEditingController txt2 = TextEditingController();
    TextEditingController txt3 = TextEditingController();
    TextEditingController txt4 = TextEditingController();

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
                top: 80,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.086,
                    ),
                    TextView(
                        label: textmap.verification.title,
                        color: TitleTextColor,
                        fontSize: 29,
                        weight: FontWeight.w600),
                    SizedBox(
                      height: h * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myInputBox(context, txt1),
                        myInputBox(context, txt2),
                        myInputBox(context, txt3),
                        myInputBox(context, txt4),
                        //myInputBox(context, txt5),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.22,
                    ),
                    GestureDetector(
                      onTap: () {
                        var Mycode =
                            txt1.text + txt2.text + txt3.text + txt4.text;
                       
                        if(verifyOTP(widget.code,Mycode)){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                             return  Registration();
                          }));
                        }
                      },
                      child: Button(
                          title: textmap.verification.buttonTitle, h: h, w: w),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget myInputBox(BuildContext context, TextEditingController controller) {
    return Container(
      height: 70,
      width: 60,
      child: TextField(
        controller: controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 40),
        decoration: const InputDecoration(
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
