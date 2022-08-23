// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class MyHeading extends StatefulWidget {
  final String title;
  const MyHeading({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHeading> createState() => _MyHeadingState();
}

class _MyHeadingState extends State<MyHeading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {
              print("Tapped on Trending Products view all");
            },
            child: Text(
              "View all",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
