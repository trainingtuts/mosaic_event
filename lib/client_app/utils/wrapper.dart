
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mosaic_event/client_app/models/user_model.dart';
import 'package:mosaic_event/client_app/screens/authentication/login_screen.dart';
import 'package:mosaic_event/client_app/screens/home_screen.dart';
import 'package:mosaic_event/services/auth_service.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<UserModel?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<UserModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? const HomeScreen() : const LoginScreen();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
