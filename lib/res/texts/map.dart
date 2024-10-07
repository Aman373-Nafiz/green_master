import 'dart:convert';
import 'package:green_master/res/texts/model.dart';

Map text = {
  "Login": {
      "title": "Welcome to GreenCycle",
      "Button_title": "Login",
      "end_title1": "Don't have a account ?",
      "end_title2": "Register"
    },
    "Registration1": {
      "title": "Get Started",
      "subtitle": "by creating an account",
      "Button_title": "Send OTP code",
      "Users": [
        "Household",
        "Restaurant",
        "Shopping mall",
        "Office",
        "Institution",
        "Factory",
        "Vangari",
        "Collectors",
        "Recycling Company"
      ],
      "end_title1": "Already a member ?",
      "end_title2": "Login"
    },
    "Registration2": {
      "title": "Get Register",
      "subtitle": "by given require information",
      "Button_title": "Register"
    },
    "Verification": {
      "title": "Please enter OTP",
      "Button_title": "Verified"
    }

};

Text textmap = Text(
  login: Login(
    title: text['Login']['title'],
    buttonTitle: text['Login']['Button_title'],
    endTitle1: text['Login']['end_title1'],
    endTitle2: text['Login']['end_title2'],
  ),
  registration1: Registration1(
    title: text['Registration1']['title'],
    subtitle: text['Registration1']['subtitle'],
    buttonTitle: text['Registration1']['Button_title'],
    users: List<String>.from(text['Registration1']['Users']),
    endTitle1: text['Registration1']['end_title1'],
    endTitle2: text['Registration1']['end_title2'],
  ),
  registration2: Registration2(
    title: text['Registration2']['title'],
    subtitle: text['Registration2']['subtitle'],
    buttonTitle: text['Registration2']['Button_title'],
  ),
  verification: Verification(
    title: text['Verification']['title'],
    buttonTitle: text['Verification']['Button_title'],
  ),
);


