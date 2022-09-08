import 'package:mosaic_event/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mosaic_event/services/cloud_service.dart';
import 'package:mosaic_event/vendor_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        Provider<CloudService>(
          create: (_) => CloudService(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: const VendorHomeScreen(),
      ),
    );
  }
}
