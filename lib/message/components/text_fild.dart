import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MytextFild extends StatelessWidget {
  MytextFild(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200)
        ),
        focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
        fillColor: Colors.grey[100],
        filled: true,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
