import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:green_master/res/colors/AppColor.dart';
import 'package:green_master/res/widget/TextView.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> items = List<int>.generate(5, (int index) => index);
    return ListView.builder(itemCount: items.length ,itemBuilder: (context, index) {
      return Column(
        children: [
          Dismissible(
              background: Container(
                color: Colors.red,
                child: Center(
                  child: Icon(Icons.delete, size: 25, color: TitleTextColor),
                ),
              ),
              key: ValueKey<int>(items[index]),
              onDismissed: (DismissDirection direction) {
                items.removeAt(index);
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/120/120'),
                  radius: 33,
                ),
                trailing: TextView(
                    label:
                        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year.toString().substring(2, 4)}',
                    color: PostbarTextColor,
                    fontSize: 13,
                    weight: null),
                title: TextView(
                    label: 'Andrew Parker',
                    color: TitleTextColor,
                    fontSize: 16,
                    weight: FontWeight.w600),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 14,
                      color: BlueTick,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    TextView(
                        label: 'Hello are you there ?',
                        color: PostbarTextColor,
                        fontSize: 13,
                        weight: FontWeight.w500)
                  ],
                ),
              )),
          Divider(
            color: Colors.grey,
          ),
        ],
      );
    });
  }
}
