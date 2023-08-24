import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleModel{
  static Text items({required String text,Color? color,required double size,var fontWeight}){
    return Text(
      text,style:TextStyle(fontSize: size,color: color,fontWeight: fontWeight),
    );
  }
}