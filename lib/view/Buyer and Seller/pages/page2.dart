import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:green_master/models/BuyerPost.dart';
import 'package:green_master/res/colors/AppColor.dart';
import 'package:green_master/view/Details/Post%20Details.dart';

import '../../../repository/Post Operation.dart';
import '../../Create Post/CreatePost.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late Buyer buyer;
  late int roleId;
  bool load = true;
  final PostOP p = PostOP();
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchbuyData();
    roleId = 0;
    //print("http://10.0.2.2:8000/storage/${_seller.data[0].files.first.url}");
  }

  void fetchbuyData() async {
    final buy = await p.getBuyersPost();
    setState(() {
      buyer = buy;
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
        : ListView.builder(
                      itemCount: buyer.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Post_Details(
                                title: buyer.data[index].title,
                                imageUrl: buyer.data[index].files.first.url,
                                content: buyer.data[index].content,
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
                                        "http://10.0.2.2:8000/storage/${buyer.data[index].files.first.url}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    buyer.data[index].title,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        );
                      })
             
          ;
  }
}
