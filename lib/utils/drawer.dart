import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mosaic_event/services/auth_service.dart';
import 'package:mosaic_event/theme/theme.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // get current user data
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return SafeArea(
      child: Drawer(
        child: Container(
          color: MyColors.drawerColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onTap: () {
                  log("Setting Pressed");
                },
                title: const Text(
                  "Setting",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(
                    () {
                      authService.signOut().then(
                            (value) => {
                              Fluttertoast.showToast(msg: 'SignOut Success'),
                            },
                          );
                    },
                  );
                },
                title: const Text(
                  "Logout",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(msg: "Logout Successfull");
  }
}
