// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constatnts.dart';
import '../../singleton.dart';

Widget rentalInfo() {
  final _servicio = new ServicioSingleton(); // instancia del singletone

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: kPaddingSmall),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(kRadiusSmall),
      child: Column(
        children: [
          _buildInfo(
            icono: Icon(Icons.location_on,
            
             color: kWhite),
            subtitulo: 'المكان ',
            titulo: _servicio.destino,
          ),
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable: _servicio.diaINICIO,
                builder:
                    (BuildContext context, DateTime? value, Widget? child) {
                  return Expanded(
                    child: _buildInfo(
                        subtitulo: 'من ',
                        titulo: value == null
                            ? ''
                            : DateFormat('dd-MM-yy').format(
                                value), //DateFormat ya lo convierte a String :D
                        icono: Icon(
                          Icons.car_rental,
                          color: kWhite,
                        )),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: _servicio.diaFIN,
                builder:
                    (BuildContext context, DateTime? value, Widget? child) {
                  return Expanded(
                    child: _buildInfo(
                        subtitulo: 'الي',
                        titulo: value == null
                            ? ''
                            : DateFormat('dd-MM-yy').format(
                                value), //DateFormat ya lo convierte a String :D
                        icono: Icon(
                          Icons.car_rental,
                          color: kWhite,
                        )),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

///////////// build the boxes with the information of each thing

Widget _buildInfo({String? titulo, String? subtitulo, Icon? icono}) {
  return Container(
    padding: EdgeInsets.all(kPaddingSmall),
    decoration: BoxDecoration(
      color:Colors.grey.withOpacity(0.4),
      border: Border.all(color: Color(0xff0125E1).withOpacity(0.2)),
         boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
              boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius:5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]

          ),
          child: CircleAvatar(
            backgroundColor: Color(0xff0125E1).withOpacity(0.2),
            child: icono,
          ),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(subtitulo!,
            style: TextStyle(
              color: kWhite
            ),
            ),
            Text(titulo!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                color: kWhite
                )),
          ],
        )
      ],
    ),
  );
}
