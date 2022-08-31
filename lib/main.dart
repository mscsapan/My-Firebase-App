import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_firebase/screen/authentic/user_registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      home: UserRegistration(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
