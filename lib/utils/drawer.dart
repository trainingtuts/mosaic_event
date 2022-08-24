// ignore_for_file: prefer_const_constructors, unused_import

// import 'package:authentication_system/utils/upload_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:authentication_system/themes/my_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mosaic_event/services/auth_service.dart';
import 'package:mosaic_event/theme/theme.dart';
import 'package:provider/provider.dart';

// import '../models/user_model.dart';
// import '../pages/login_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // get current user data
  User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedInUser = UserModel();
  // @override
  // void initState() {
  //   FirebaseFirestore.instance
  //       .collection("user")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     loggedInUser = UserModel.fromMap(value.data());
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    const imageUrl = "https://avatars.githubusercontent.com/u/56643117?v=4";

    return Drawer(
      child: Container(
        color: MyColors.drawerColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: authService.userID() != null
                    ? Text("${authService.userID()}")
                    : Text("data"),
                accountEmail: Text("email Adrees"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.upload,
                color: Colors.white,
              ),
              onTap: () {
                // TODO: profile pic
                // UploadImage.uploadImage(
                //     userId: loggedInUser.uid, folder: "profile");
              },
              title: const Text(
                "Upload Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
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
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(msg: "Logout Successfull");
    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
