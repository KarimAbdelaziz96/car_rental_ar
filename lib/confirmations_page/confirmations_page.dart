import 'package:car_rental/constatnts.dart';
import 'package:car_rental/models.dart';
import 'package:car_rental/pay_page/pay_page.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';
import 'package:car_rental/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'confirmations_widgets/tile.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({this.recibirDatos});
  final AutosModel? recibirDatos;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, titulo: 'تأكيد الحجز'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kPaddingSmall),
            child: Column(
              children: [
                resumen(recibirDatos!),
                _resumenDeLaOrden(recibirDatos: recibirDatos),
                _completeConSusDatos(context),
                botonGenerico(
                    bgColor: Color(0xff0125E1).withOpacity(0.1) ,
                    titulo: 'اكد و ادفع',
                    onPress: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (builder) =>
                                PayPage())) //() => Navigator.pushNamed(context, '/payPage')
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget resumen(AutosModel recibirDatos) {
  final _servicio = ServicioSingleton();

  return Column(
    children: [
      tile(
        titulo: 'نموذج:',
        trailingIcon:
            '${recibirDatos.marca} ${recibirDatos.modelo}', // precio x dia * cant de dias
      ),
      Divider(
        height: 0.5,
      ),
      tile(
        titulo: 'مجموع الأيام:',
        trailingIcon: '${_servicio.diasTOTALES}',
      ),
      Divider(
        height: 0.5,
      ),
      tile(
        titulo: 'المكان :',
        trailingIcon: '${_servicio.destino}',
      )
    ],
  );
}

Widget _resumenDeLaOrden({
  AutosModel? recibirDatos,
}) {
  final _servicio = ServicioSingleton();

  int _precioBase = recibirDatos!.precio! * _servicio.diasTOTALES;
  double _gastosMasAccesorios =
      (recibirDatos.precio! * _servicio.diasTOTALES) / 8.toInt().truncate();
  double _depositoReintegrable =
      (recibirDatos.precio! * _servicio.diasTOTALES) / 4.toInt().truncate();
  double _totalAPagar = _precioBase +
      _gastosMasAccesorios +
      _depositoReintegrable.toInt().truncate();

  return Container(
    margin: EdgeInsets.symmetric(vertical: kPaddingSmall),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xff0125E1).withOpacity(0.1),
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(kRadiusSmall))),
          child: Center(
              child: Text(
            'ملخص طلبك للدفع',
            style: TextStyle(fontSize: 18, color: kWhite),
          )),
        ),
        Padding(
          // info
          padding: EdgeInsets.symmetric(horizontal: kPaddingBig),
          child: Column(
            children: [
              tile(
                titulo: 'السعر الأساسي',
                trailingIcon: 'SAR $_precioBase', // precio x dia * cant de dias
              ),
              Divider(
                height: 0.5,
              ),
              tile(
                titulo: 'مصاريف + اكسسوارات',
                trailingIcon: 'SAR $_gastosMasAccesorios',
              ),
              Divider(
                height: 0.5,
              ),
              tile(
                titulo: 'إيداع قابل لإعادة التعبئة',
                trailingIcon: 'SAR $_depositoReintegrable',
              ),
              Divider(
                height: 0.5,
              ),
              tile(
                  titulo: 'مجموع للدفع',
                  trailingIcon: 'SAR $_totalAPagar',
                  bold: true),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _completeConSusDatos(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: kPaddingSmall),
    child: Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xff0125E1).withOpacity(0.1),
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(kRadiusSmall))),
          child: Center(
              child: Text(
            'أكمل مع بياناتك الشخصية',
            style: TextStyle(fontSize: 18, color: kWhite),
          )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextField(
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "الاسم واللقب",
                  hintStyle: TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      decorationColor: kWhite,
                      color: kWhite,
                      fontStyle: FontStyle.italic),
                ),
              ),
              TextField(
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'الجنسية',
                  hintStyle: TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      decorationColor: kWhite,
                      color: kWhite,
                      fontStyle: FontStyle.italic),
                ),
              ),
              TextField(
                keyboardType: TextInputType.datetime,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'الايام',
                  hintStyle: TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      decorationColor: kWhite,
                      color: kWhite,
                      fontStyle: FontStyle.italic),
                ),
              ),
              TextField(
                keyboardType: TextInputType.datetime,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'تاريخ الميلاد',
                  hintStyle: TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      decorationColor: kWhite,
                      color: kWhite,
                      fontStyle: FontStyle.italic),
                ),
              ),
               TextField(
                keyboardType: TextInputType.phone,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'رقم الجوال ',
                  hintStyle: TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      decorationColor: kWhite,
                      color: kWhite,
                      fontStyle: FontStyle.italic),
                ),
              ),
                    TextField(
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  
                  hintText: 'الايميل',
                  hintStyle: TextStyle(
                    
                      textBaseline: TextBaseline.alphabetic,
                      decorationColor: kWhite,
                      color: kWhite,
                      fontStyle: FontStyle.italic),
                ),
              ),
              
              

              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget datosPersonales(String hinttext,
    {TextInputAction action = TextInputAction.next}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: kPaddingSmall),
    height: 60,
    child: TextField(
      textInputAction: action,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(
            textBaseline: TextBaseline.alphabetic,
            decorationColor: kWhite,
            color: kWhite,
            fontStyle: FontStyle.italic),
      ),
    ),
  );
}
