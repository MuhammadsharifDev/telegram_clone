import 'package:flutter/material.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';

class BottomStyleModel{
  static  ButtonStyle item(){
    return ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 55),
      backgroundColor: AppColors.C_36B8B8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}