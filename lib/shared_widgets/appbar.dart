import 'package:flutter/material.dart';
import '../constatnts.dart';


AppBar appBar( context, {String? titulo, bgColor = kYellow}){

  return
  AppBar(
    title: Text(titulo!, style: TextStyle(color: Colors.white),),
    centerTitle: true,
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios, color:kWhite,)
    ),
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Color(0xff0125E1).withOpacity(0.1),
    elevation: 0,
  );
}