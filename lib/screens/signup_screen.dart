// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final defaultImage = Image.asset('assets/default/default_pp.png');
  // auth
  // final _auth = FirebaseAuth.instance;

  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // firstname field
    final firstnameField = TextFormField(
      autofocus: false,
      controller: firstnameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return "Please enter first name";
        }
        if (!regex.hasMatch(value)) {
          return "Enter minimum 3 Character";
        }
        return null;
      },
      onSaved: (value) {
        firstnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // lastname field
    final lastnameField = TextFormField(
      autofocus: false,
      controller: lastnameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return "Please enter last name";
        }
        if (!regex.hasMatch(value)) {
          return "Enter minimum 3 Character";
        }
        return null;
      },
      onSaved: (value) {
        lastnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter email address";
        }
        if (!RegExp('[a-z0-9]+@[a-z]+.[a-z]{2,3}').hasMatch(value)) {
          return "Please enter valid email address";
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email Address",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // phone no field
    final phoneNoField = IntlPhoneField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        counter: Offstage(),
        labelText: 'Mobile Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      showDropdownIcon: false,
      flagsButtonPadding: EdgeInsets.only(left: 12),
      initialCountryCode: 'PK',
    );

    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Password is required for signup";
        }
        if (!regex.hasMatch(value)) {
          return "Please enter valid password(Min. 6 Character)";
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // confirmPassword field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      validator: (value) {
        if (passwordController.text != value) {
          return "Password did not match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // SignUp button
    final signupButton = Material(
      elevation: 5,
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: () {
          // signUp(emailController.text, passwordController.text);
        },
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // passing to our root
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text("Create an account"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Profile Pic
                    GestureDetector(
                      onTap: () {
                        log("Upload image");
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 70,
                        child: ClipRRect(
                          child: Image.network(
                            "http://www.google.de/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
                            loadingBuilder: (context, child, loadingProgress) =>
                                (loadingProgress == null)
                                    ? child
                                    : CircularProgressIndicator(),
                            errorBuilder: (context, error, stackTrace) =>
                                defaultImage,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    firstnameField,
                    const SizedBox(height: 10),
                    lastnameField,
                    const SizedBox(height: 10),
                    emailField,
                    const SizedBox(height: 10),
                    phoneNoField,
                    // const SizedBox(height: 10),
                    passwordField,
                    const SizedBox(height: 10),
                    confirmPasswordField,
                    const SizedBox(height: 10),
                    signupButton,
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // signup function
  // void signUp(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) => {postDetailsToFirestore()})
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }

  /* postDetailsToFirestore() async {
    // 1. calling our firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    // 2. calling our user_model
    UserModel userModel = UserModel();
    // 3. writing values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = firstnameController.text;
    userModel.lastname = lastnameController.text;
    // 4. sending values to DB
    await firebaseFirestore
        .collection("user")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully :)");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }*/
}
