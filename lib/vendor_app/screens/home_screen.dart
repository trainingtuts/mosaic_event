// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mosaic_event/client_app/utils/bottom_appbar.dart';

import 'package:mosaic_event/vendor_app/screens/service_detail_screen.dart';
import 'package:mosaic_event/vendor_app/utils/service_card.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({Key? key}) : super(key: key);

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 110,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/default/m.png'),
                    radius: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Full Name",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Bio
            Text(
              "Bio",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Description
            Text(
              "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Molestias aut, repellat ipsum facere voluptate dicta obcaecati deserunt nobis suscipit eaque?",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 21,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      log("Service $index pressed");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceDetailScreen(
                                    serviceTitle: "Service Title",
                                  )));
                    },
                    child: ServiceCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}