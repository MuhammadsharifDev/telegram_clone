import 'package:flutter/material.dart';
import 'package:telegram_clone/src/const/utils/app_colors.dart';

class TextFormFiledModel{
  static InputDecoration items({required String text,IconData? suffixIcon}){
    return InputDecoration(
        hintText: text,
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(color: AppColors.C_36B8B8),
    ),
    );
  }
}