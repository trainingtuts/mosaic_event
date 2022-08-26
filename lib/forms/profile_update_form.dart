// ignore_for_file: must_be_immutable,

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mosaic_event/services/auth_service.dart';
import 'package:provider/provider.dart';

class UpdateForm extends StatefulWidget {
  const UpdateForm({Key? key}) : super(key: key);

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  String? _email;
  PhoneNumber? phoneNumber;

  final _genderList = ['Male', 'Female', 'Other'];
  final _roleList = ['Personal', 'Business'];

  // form key
  final _updateProfileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    // CollectionReference usersCollection =
    // FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Form"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _updateProfileFormKey,
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(authService.userID())
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              if (snapshot.hasData && !snapshot.data!.exists) {
                return const Text("Document does not exist");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> userData =
                    snapshot.data!.data() as Map<String, dynamic>;
                _email = userData['email'];
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      autofocus: false,
                      initialValue: _email,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter email address";
                        }
                        if (!RegExp('[a-z0-9]+@[a-z]+.[a-z]{2,3}')
                            .hasMatch(value)) {
                          return "Please enter valid email address";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _email = value;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Material(
                      elevation: 5,
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      child: MaterialButton(
                        onPressed: () {
                          updateUserProfile(_email);
                        },
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        minWidth: MediaQuery.of(context).size.width,
                        child: const Text(
                          "Update",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  //update method
  Future<void> updateUserProfile(email) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.userID())
        .update({'email': email}).then((value) {
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: "Email Updated",
        toastLength: Toast.LENGTH_LONG,
      );
    }).catchError((error) {
      Fluttertoast.showToast(msg: "Error occured: $error");
    });
  }
}
