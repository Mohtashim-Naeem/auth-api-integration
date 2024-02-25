import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labeltext;
  final Widget icon;
  final double size;
  const CustomTextField(
      {super.key,
      this.controller,
      required this.labeltext,
      required this.icon,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: size),
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white,
        label: Text(labeltext),
        labelStyle:
            TextStyle(fontSize: size, color: Colors.black, letterSpacing: .5),
        suffixIcon: IconButton(
          icon: icon,
          onPressed: () {},
        ),
        suffixIconColor: Colors.purple,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple, width: 2.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white, width: 2.5)),
      ),
    );
  }
}
