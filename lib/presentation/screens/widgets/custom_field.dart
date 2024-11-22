import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTextField(String hintText, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}