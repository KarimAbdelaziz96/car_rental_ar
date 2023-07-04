// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import '../constatnts.dart';

ElevatedButton botonGenerico(
    {String? titulo,
    void Function()? onPress,
    Color? bgColor,
    Color? textColor}) {
  return ElevatedButton(
    
      onPressed: onPress,
      style: ButtonStyle(
        
        
        backgroundColor: bgColor == null
            ? MaterialStateProperty.all( Color(0xff0125E1).withOpacity(0.2))
            : MaterialStateProperty.all(bgColor),
        foregroundColor: textColor == null
            ? MaterialStateProperty.all(kWhite)
            : MaterialStateProperty.all(textColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusSmall))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titulo!,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
          ),
        ],
      ));

 
}
