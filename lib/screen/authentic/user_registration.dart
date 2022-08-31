import 'package:flutter/material.dart';
import 'package:my_firebase/views/user_input.dart';

class UserRegistration extends StatelessWidget {
  const UserRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)
            .copyWith(bottom: size.height * 0.05),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const UserInput(hintText: 'Your Name'),
            const UserInput(hintText: 'Your Email'),
            const UserInput(hintText: 'Your Password', isObscure: true),
            const SizedBox(height: 20.0),
            SizedBox(
              width: size.width,
              height: size.height * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[900]),
                onPressed: () {},
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
