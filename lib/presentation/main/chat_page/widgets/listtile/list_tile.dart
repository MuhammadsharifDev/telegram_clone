import 'package:flutter/material.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';

class ListTileModel{
  static ListTile items({required String title,required String subtitle,required String trailing,required String image}){
    return   ListTile(
      leading: CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage(image),
      ),
      title: TextStyleModel.items(text: title, size: 16,color: Colors.black),
      subtitle: Text(subtitle) ,
      trailing:  Text(trailing),
    );
  }
}