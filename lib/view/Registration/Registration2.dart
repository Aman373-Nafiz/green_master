import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:green_master/models/District.dart';
import 'package:green_master/models/Upazilla.dart';
import 'package:green_master/repository/ApiService.dart';
import 'package:green_master/res/colors/Appcolor.dart';
import 'package:green_master/res/texts/map.dart';
import 'package:green_master/view/Redirect%20Screens/Redirect_from_register.dart';
import 'package:green_master/view/Verification/Verification.dart';
import 'package:green_master/res/widget/Button.dart';
import 'package:green_master/res/widget/TextForm.dart';
import 'package:green_master/res/widget/TextView.dart';

import '../../models/Divisons.dart';
import '../../repository/Authentication.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late Divisons div;
  late District dis;
  late Upazila upa;
  bool load = true;
  late var currString1;
  late var currString2;
  late var currString3;
  late var id1;
  late var id2;
  late var id3;
  late var DivId;
  late var DisId;
  late var UpId;
  final Auth auth = Auth();
  final name = TextEditingController();
  final area = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    currString1 = '';
    currString2 = '';
    currString3 = '';
    DivId = '';
    DisId = '';
    UpId = '';
    id1 = '';
    id2 = '';
    id3 = '';
  }

  fetchData() async {
    final apiService = ApiService();
    final divison = await apiService.fetchDivisions();
    final district = await apiService.fetchDistrict();
    final upazila = await apiService.fetchUpazila();
    setState(() {
      div = divison;
      dis = district;
      upa = upazila;
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height;
    var w = size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: BgColor,
        body: load
            ? Center(
                child: CircularProgressIndicator(
                  color: ButtonColor,
                ),
              )
            : Stack(
                children: [
                  Positioned(
                    left: -48,
                    top: -52,
                    child: Image.asset(
                      'images/circle.png',
                      height: h * 0.28,
                      width: h * 0.282,
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.083,
                        ),
                        TextView(
                          label: textmap.registration2.title,
                          color: TitleTextColor,
                          fontSize: 29,
                          weight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          textmap.registration2.subtitle,
                          style: TextStyle(
                            fontSize: 14,
                            color: TitleTextColor,
                            letterSpacing: 0.7,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.048,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        TextForm(
                          hintText: 'Full name',
                          h: h,
                          w: w,
                          Icons: Icon(Icons.person),
                          controller: name,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: (w > 500) ? h / 2.1 : h / 2.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black12,
                          ),
                          child: ExpansionTile(
                            children: [
                              ListView(
                                shrinkWrap: true,
                                children: div.data
                                    .map(
                                      (e) => ListTile(
                                        onTap: () {
                                          setState(() {
                                            currString1 = e.name;
                                            DivId = e.id;
                                            id1 = e.id.toString();
                                          });
                                        },
                                        title: Text(
                                          e.name,
                                          style: TextStyle(
                                            color: TitleTextColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                            title: Text(
                              currString1.isEmpty
                                  ? 'Select your Division'
                                  : currString1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: (w > 500) ? h / 2.1 : h / 2.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black12,
                          ),
                          child: ExpansionTile(
                            children: [
                              ListView(
                                shrinkWrap: true,
                                children: dis.data.map(
                                  (e) {
                                    if (currString1.toString() ==
                                        e.division.name) {
                                      return ListTile(
                                        onTap: () {
                                          setState(() {
                                            currString2 = e.name;
                                            DisId = e.divisionId;
                                            id2 = e.id.toString();
                                          });
                                        },
                                        title: Text(
                                          e.name,
                                          style: TextStyle(
                                            color: TitleTextColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return SizedBox.shrink();
                                    }
                                  },
                                ).toList(),
                              ),
                            ],
                            title: Text(
                              currString2.isEmpty || DivId != DisId
                                  ? 'Select your District'
                                  : currString2,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: (w > 500) ? h / 2.1 : h / 2.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black12,
                          ),
                          child: ExpansionTile(
                            children: [
                              ListView(
                                shrinkWrap: true,
                                children: upa.data.map(
                                  (e) {
                                    if (currString2.toString() ==
                                        e.district.name) {
                                      return ListTile(
                                        onTap: () {
                                          setState(() {
                                            currString3 = e.name;
                                            UpId = e.districtId;
                                            id3 = e.id.toString();
                                          });
                                        },
                                        title: Text(
                                          e.name,
                                          style: TextStyle(
                                            color: TitleTextColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return SizedBox.shrink();
                                    }
                                  },
                                ).toList(),
                              ),
                            ],
                            title: Text(
                              currString3.isEmpty
                                  ? 'Select your Upazila'
                                  : currString3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextForm(
                          hintText: 'Area name',
                          h: h,
                          w: w,
                          Icons: Icon(Icons.location_city),
                          controller: area,
                        ),
                        SizedBox(
                          height: h * 0.167,
                        ),
                        GestureDetector(
                          onTap: () async {
                            print(id1+id2);
                            
                            var check = await auth.Register2(
                                name.text, id1, id2, id3, area.text);
                            if (check) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Register_to_Homepages();
                              }));
                            } else {
                              print('Can\'t access homepage');
                            }
                          },
                          child: Button(
                            title: textmap.registration2.buttonTitle,
                            h: h,
                            w: w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
