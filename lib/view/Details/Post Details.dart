import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:green_master/repository/Post%20Operation.dart';
import 'package:green_master/res/colors/AppColor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/SellerPost.dart';
import 'package:sqflite/sqflite.dart';

import '../../res/widget/TextView.dart';

class Post_Details extends StatefulWidget {
  var title;
  var imageUrl;
  var content;
  Post_Details(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.content});

  @override
  State<Post_Details> createState() => _Post_DetailsState();
}

class _Post_DetailsState extends State<Post_Details> {
  late var phnNumb;
  @override
  void initState() {
    phnNumb = '';
    getPhoneNumber();
    // TODO: implement initState
  }

  getPhoneNumber() async {
    SharedPreferences phoneNumber = await SharedPreferences.getInstance();
    String x = await phoneNumber.getString('phoneNumber') ?? " ";
    setState(() {
      phnNumb = x;
    });
  }

  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: BgColor,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 22,
            ),
          ),
          backgroundColor: ButtonColor,
          title: TextView(
              label: 'Green Cycle',
              color: TitleTextColor,
              fontSize: 18,
              weight: FontWeight.w700),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: ListView(
            children: [
              SizedBox(height: h * 0.06),
              Container(
                height: h / 3,
                width: h / 2.25,
                /* decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage("http://10.0.2.2:8000/storage/${_seller.data[index].files.first.url}"
                                            ),
                                        fit: BoxFit.fill)),*/
                child: CachedNetworkImage(
                  imageUrl: "http://10.0.2.2:8000/storage/${widget.imageUrl}",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: h * 0.015,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Title :",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: ButtonColor,
                    )),
                WidgetSpan(
                    child: SizedBox(
                  width: 5,
                )),
                TextSpan(
                    text: widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: TitleTextColor,
                      fontWeight: FontWeight.w500,
                    ))
              ])),
              SizedBox(
                height: h * 0.02,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Description :",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: ButtonColor,
                      )),
                  WidgetSpan(
                      child: SizedBox(
                    width: 5,
                  )),
                  TextSpan(
                      text: widget.content,
                      style: TextStyle(
                        fontSize: 18,
                        color: TitleTextColor,
                        fontWeight: FontWeight.w500,
                      ))
                ])),
              )),
              SizedBox(
                height: h * 0.2,
              ),
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: phnNumb,
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    print("Cannot handle this features");
                    Fluttertoast.showToast(
                        msg: "Sorry phone cannot be redirected",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0);
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 22,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      phnNumb.toString(),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
