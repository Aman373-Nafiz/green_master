import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:green_master/repository/Post%20Operation.dart';
import 'package:green_master/res/colors/AppColor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:green_master/view/Details/Post%20Details.dart';
import '../../../models/SellerPost.dart';
import '../../Create Post/CreatePost.dart';
import 'package:sqflite/sqflite.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  late Seller seller;
  late int roleId;
  bool load = true;
  final PostOP p = PostOP();
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchsellData();
    roleId = 0;
    //print("http://10.0.2.2:8000/storage/${_seller.data[0].files.first.url}");
  }

  void fetchsellData() async {
    final sell = await p.getSellerPost();
    setState(() {
      seller = sell;
      load = false;
    });
  }

  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return (load)
        ? Center(
            child: CircularProgressIndicator(
              color: ButtonColor,
            ),
          )
        : Container(
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.016,
                ),
                Padding(
                  padding: EdgeInsets.only(left: h * 0.01),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Posting();
                              }));
                            },
                            child: Container(
                              height: h * 0.05,
                              decoration: BoxDecoration(
                                  color: PostbarColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: 20,
                                    color: PostbarTextColor,
                                  ),
                                  SizedBox(width: 8), // Adjusted spacing
                                  Text(
                                    'Create a sell post',
                                    style: TextStyle(
                                        fontSize: 17, color: PostbarTextColor),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.mic, size: 24, color: TitleTextColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.025,
                ),
                Expanded(
                    child: Container(
                  child: ListView.builder(
                      itemCount: seller.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Post_Details(
                                title: seller.data[index].title,
                                imageUrl: seller.data[index].files.first.url,
                                content: seller.data[index].content,
                              );
                            }));
                          },
                          child: Container(
                            child: Column(
                              children: [
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
                                    imageUrl:
                                        "http://10.0.2.2:8000/storage/${seller.data[index].files.first.url}",
                                    height: h / 4,
                                    width: h / 3,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    seller.data[index].title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        );
                      }),
                ))
              ],
            ),
          );
  }
}
