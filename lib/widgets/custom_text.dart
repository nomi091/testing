import 'package:flutter/material.dart';
import 'package:testing/services/app_colors.dart';

TextFormField customtextformfeild({required controller, hintText}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,

      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppColors.secondry, width: 1)),

      // enabledBorder: Bor
    ),
  );
}
