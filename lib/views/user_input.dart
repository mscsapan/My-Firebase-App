import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  const UserInput({Key? key, required this.hintText, this.isObscure = false})
      : super(key: key);
  final String hintText;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        hintText: hintText,
      ),
      obscuringCharacter: '*',
      obscureText: isObscure ? true : false,
    );
  }
}
