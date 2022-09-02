import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_firebase/auth_provider/auth_provider.dart';
import 'package:my_firebase/screen/authentic/user_registration.dart';
import 'package:my_firebase/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => ChangeNotifierProvider<AuthProvider>(
              create: (context) => AuthProvider(),
              child: UserRegistration(),
            ),
        '/home_screen': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
