import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider with ChangeNotifier {
  bool isShow = false;
  bool loading = false;

  void showPassword() {
    isShow = !isShow;
    notifyListeners();
  }

  Future<void> createAndStoreUser(
      BuildContext context, String name, String email, String password) async {
    if (name.trim().isEmpty) {
      messages("Name can't be Empty");
    } else if ((email.isEmpty) || !(email.contains('@'))) {
      messages('Invalid or Empty');
    } else if (password.isEmpty || password.length < 4) {
      messages('Empty or Short Password');
    } else {
      try {
        loading = true;
        notifyListeners();
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => messages('Successfully Register'));
        loading = true;
        notifyListeners();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          "name": name,
          "email": email,
          "password": password,
          "uid": userCredential.user!.uid,
        }).then((value) {
          loading = false;
          notifyListeners();
          Navigator.pushNamed(context, '/home_screen');
        });
      } on FirebaseAuthException catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}

messages(String message) {
  return Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 20.0,
      gravity: ToastGravity.CENTER);
}
