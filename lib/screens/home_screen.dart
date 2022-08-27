// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mosaic_event/models/user_model.dart';
import 'package:mosaic_event/services/auth_service.dart';
import 'package:mosaic_event/theme/theme.dart';
import 'package:mosaic_event/utils/bottom_appbar.dart';
import 'package:mosaic_event/utils/carousel.dart';
import 'package:mosaic_event/utils/categories.dart';
import 'package:mosaic_event/utils/drawer.dart';
import 'package:mosaic_event/utils/heading.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final List _imageUrl = [
    "assets/images/image_1.png",
    "assets/images/image_2.png",
    "assets/images/image_3.png",
  ];
  bool showBottomAppBar = true;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      drawer: MyDrawer(),
      // App Bar
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: MyColors.primaryColor,
        title: Text(
          "Welcome, ${authService.currentUser!.displayName}",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: MyColors.primaryColor,
            child: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () {
                log("message");
              },
              child: CircleAvatar(
                backgroundColor: MyColors.primaryColor,
                child: const Icon(
                  Icons.sunny,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          controller: _scrollController,
          children: [
            // Account Info

            // Top row
            MyHeading(title: "Promotions"),

            // Top Banner
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/image_1.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // Categories Heading
            MyHeading(title: "Categories"),

            // Catagories
            MyCatagories(),

            // Trending Heading
            MyHeading(title: "Trending"),

            // Carousel
            MyCarousel(),
          ],
        ),
      ),
      // BottomAppBar
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
