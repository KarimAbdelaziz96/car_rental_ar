import 'package:car_rental/calendar_page/calendar_page.dart';
import 'package:car_rental/car_Details/car_details_page.dart';
import 'package:car_rental/car_selection_page/car_selection_page.dart';
import 'package:car_rental/confirmations_page/confirmations_page.dart';
import 'package:car_rental/home-page/home_page2.dart';
import 'package:car_rental/pay_page/pay_page.dart';
import 'package:car_rental/splash.dart';
import 'package:car_rental/ultima_pagina/ultima_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  //para que la fecha del calendario se vea en español usamos 'initializeDateFormatting().then()'
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'SNAP Car Rental',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff23242D),
        fontFamily: 'Exo',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        'HomePage': (context) => HomePage(),
        '/carSelectionPage': (context) => CarSelectionPage(),
        '/calendarPage': (context) => CalendarPage(),
        '/carDetailsPage': (context) => CarDetailsPage(),
        '/confirmationsPage': (context) => ConfirmationPage(),
        '/payPage': (context) => PayPage(),
        '/ultimaPagina': (context) => UltimaPagina(),
      },
    );
  }
}
