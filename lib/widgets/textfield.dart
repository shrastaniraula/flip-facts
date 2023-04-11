import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hasAsterisks;

  CustomTextField(
      {Key? key,
      required this.controller,
      this.hasAsterisks = false,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: hasAsterisks,
        decoration: InputDecoration(
          hintText: hintText,
        ));
  }
}
