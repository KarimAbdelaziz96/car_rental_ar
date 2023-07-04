// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color kYellow = Color(0xff23242D);
const Color kWhite = Colors.white;
Color kDarkGrey = Color(0xFF3D2C8D);
Color kDarkGrey2 = Colors.grey;

const Color kBlack = Colors.black;
Color kLightGrey = Color(0xFF0D63A5);
const Color kGrey = Colors.grey;
const Color nw = Color(0xff0125E1);

const Color kBlue = Color(0xFF3D2C8D);

const double kPaddingBig = 25;
const double kPaddingSmall = 15;
const double kPaddingSmallSmall = 8;

const double kRadiusBig = 20;
const double kRadiusSmall = 10;

List<BoxShadow> kSombra = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 7,
    blurRadius: 10,
    offset: Offset(0, 0), // changes position of shadow
  )
];

var kDecorationWithShadow = BoxDecoration(
  border: Border.all(color: kDarkGrey, width: 1, style: BorderStyle.solid),
  color: kWhite,
  borderRadius: BorderRadius.circular(kRadiusSmall),
  boxShadow: kSombra,
);

var kDecoration2 = BoxDecoration(
  color: kLightGrey,
  borderRadius: BorderRadius.vertical(top: Radius.circular(kRadiusBig)),
);

var kDecoration = BoxDecoration(
  border: Border.all(color: kDarkGrey, width: 1, style: BorderStyle.solid),
  color: kWhite,
  borderRadius: BorderRadius.circular(kRadiusSmall),
);

kInputDecoration({String? hintText, suffix}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: kPaddingSmallSmall),
    hintText: hintText,
    hintStyle: TextStyle(color: kDarkGrey),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadiusSmall),
        borderSide: BorderSide(color: kYellow)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kDarkGrey),
        borderRadius: BorderRadius.circular(kRadiusSmall)),
    suffixIcon: suffix,
  );
}

List<Widget> ImageIntro = [
  Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image.asset(
        'images/مرسيدس-G63-2023.png',
        height: 200,
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        decoration: BoxDecoration(
          boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: Text(
          "Mercedes G Class",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: kWhite),
        ),
      )
    ],
  ),
  Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image.asset(
        'images/rolsroys.png',
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: Text(
          "Rolls Royce ",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: kWhite),
        ),
      )
    ],
  ),
  Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image.asset(
        'images/RollsRos.png',
        height: 200,
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: Text(
          "Rolls Royce ",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: kWhite),
        ),
      )
    ],
  ),
  Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image.asset(
        'images/panamera.png',
        height: 200,
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: Text(
          "Panamera",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: kWhite),
        ),
      )
    ],
  ),
  Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image.asset(
        'images/huracan.png',
        height: 200,
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: Text(
          "Huracan",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: kWhite),
        ),
      )
    ],
  ),
  Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image.asset(
        'images/auto_portada.png',
        height: 200,
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: Text(
          "Portada",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: kWhite),
        ),
      )
    ],
  ),
];
