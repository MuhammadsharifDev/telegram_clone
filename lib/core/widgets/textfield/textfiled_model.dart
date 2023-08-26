import 'package:flutter/material.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';

class TextFormFiledModel {
  static InputDecoration items(
      {required String text,
      var suffixIcon,
      Color? color,
      Color? color2,
      var prefixIcon}) {
    return InputDecoration(
      fillColor: color,
      filled: true,
      hintText: text,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.C_36B8B8),
      ),
    );
  }
}
