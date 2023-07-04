import 'package:flutter/material.dart';
import '../../constatnts.dart';
import '../../models.dart';
import '../../singleton.dart';

Widget tarjetita(
    {AutosModel? autosModel,
    context,
    void Function()? onTapVerMas,
    void Function()? onTapRentar}) {
  final _servicio = new ServicioSingleton();

  return Container(
    padding: EdgeInsets.all(kPaddingSmall),
    margin: EdgeInsets.symmetric(vertical: kPaddingSmall / 2),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              //////////////////// INFO + FOTO DEL AUTO
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${autosModel!.marca}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: kWhite),
                  ),
                  Text(
                    '${autosModel.modelo}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: kWhite),
                  ),
                  Row(
                    // modelo de auto y valoracion
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                      ),
                      Text(
                        autosModel.valoracion.toString(),
                        style: TextStyle(color: kWhite),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.person_sharp,
                        color: kGrey,
                      ),
                      Text(
                        autosModel.asientos.toString(),
                        style: TextStyle(color: kWhite),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
                // imagen del auto
                flex: 3,
                child: Image.asset(
                  autosModel.image[0],
                  fit: BoxFit.contain,
                ))
          ],
        ),
        Divider(),
        Column(
          ///////////////////////// PRECIOSSS
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
                // precio por dia
                'السعر في اليوم: ${autosModel.precio}',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: kWhite)),
            Divider(),
            Text(
                // precio total a pagar
                'إجمالي المبالغ المستحقة ${_servicio.diasTOTALES} أيام: \ٍSAR${autosModel.precio! * _servicio.diasTOTALES}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16, color: kWhite)),
          ],
        ),
        Divider(),
        Row(
          // botones ver mas y rentar
          children: [
            Spacer(),
            _botoncito(onTapVerMas!, titulo: 'انظر المزيد من التفاصيل'),
            SizedBox(
              width: 8,
            ),
            _botoncito(onTapRentar!, titulo: 'إيجار الآن!'),
          ],
        )
      ],
    ),
  );
}

ClipRRect _botoncito(Function()? onTap, {String? titulo}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(kRadiusBig),
    child: GestureDetector(
      onTap: onTap, //() => Navigator.pushNamed(context, '/carDetailsPage'),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff0125E1).withOpacity(0.2),
           boxShadow: [
          BoxShadow(
            color:Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          titulo!,
          style: TextStyle(fontWeight: FontWeight.bold, color: kWhite),
        ),
      ),
    ),
  );
}
