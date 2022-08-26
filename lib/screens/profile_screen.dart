// ignore_for_file: prefer_const_constructors,

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mosaic_event/forms/profile_update_form.dart';
import 'package:mosaic_event/services/auth_service.dart';
import 'package:mosaic_event/theme/theme.dart';
import 'package:mosaic_event/utils/upload_image.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    final authService = Provider.of<AuthService>(context);
    final cloudService = Provider.of<CloudService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: StreamBuilder(
        stream:
            cloudService.usersCollection.doc(authService.userID()).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return Container(
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundColor: MyColors.primaryColor,
                      child: CircleAvatar(
                        radius: 38.0,
                        backgroundImage: data['profileUrl'] != null
                            ? NetworkImage("${data['profileUrl']}")
                            : AssetImage("assets/default/default_pp.png")
                                as ImageProvider,
                        child: GestureDetector(
                          onTap: () {
                            UploadImage.uploadProfileImage();
                            log("profile Pic");
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12.0,
                              child: Icon(
                                Icons.camera_alt,
                                size: 15.0,
                                color: Color(0xFF404040),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        "${data['fullname']}",
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "${data['gender']} | ${data['role']}",
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateForm()));
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.amberAccent),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                          decoration: BoxDecoration(
                            color: MyColors.primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // TODO: delete User
                        authService.currentUser!.delete();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.amberAccent),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        decoration: BoxDecoration(
                          color: MyColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Text(
                          'Delete Profile',
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
