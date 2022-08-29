import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_firebase/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
