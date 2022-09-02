import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  const UserInput(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.suffixIcon,
      this.isObscure})
      : super(key: key);
  final String hintText;
  final bool? isObscure;
  final TextEditingController controller;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscure ?? false,
    );
  }
}
