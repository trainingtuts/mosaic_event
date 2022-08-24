import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mosaic_event/screens/home_screen.dart';
import 'package:mosaic_event/services/auth_service.dart';
import 'package:mosaic_event/utils/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await AuthService().getOrCreateUser();

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
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: const Wrapper(),
      ),
    );
  }
}
