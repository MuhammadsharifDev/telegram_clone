import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleModel{
  static Text items({required String text,Color? color,required double size,var fontWeight,  TextAlign? textAlign}){
    return Text(
      text,style:GoogleFonts.inter(fontSize: size,color: color,fontWeight: fontWeight),
    );
  }
}