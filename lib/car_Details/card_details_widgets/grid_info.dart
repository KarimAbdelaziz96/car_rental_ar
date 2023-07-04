import 'package:flutter/material.dart';
import '../../constatnts.dart';

Widget infoGrid({String? info, IconData? icon}) {
  return Container(
    
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.2),
       borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 20,
        color: kWhite,
        ),        
        Text(info!,
        style: TextStyle(
          color: kWhite
        ),)
      ],
    ),
  );
}