// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage {
  // Upload Profile Image
  static uploadProfileImage() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userId = FirebaseAuth.instance.currentUser!.uid;
    File? image;
    final imagePicker = ImagePicker();
    String? downloadURL;

    final selectedImage = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    if (selectedImage != null) {
      image = File(selectedImage.path);
    } else {
      Fluttertoast.showToast(msg: "No File selected");
    }

    final imgId =
        DateTime.now().millisecondsSinceEpoch.toString(); // For unique name

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('users')
        .child('profile_pic')
        .child("img_$imgId");

    await reference.putFile(image!);
    downloadURL = await reference.getDownloadURL();

    // cloud firestore
    await firebaseFirestore
        .collection('users')
        .doc(userId)
        .update({'profileUrl': downloadURL})
        .whenComplete(() => {
              currentUser!.updatePhotoURL(downloadURL),
              Fluttertoast.showToast(msg: "Image Uploaded"),
            })
        .catchError((onError) {
          Fluttertoast.showToast(msg: onError);
        });
  }
}
