// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_rental/car_Details/card_details_widgets/rental_info.dart';
import 'package:car_rental/confirmations_page/confirmations_page.dart';
import 'package:car_rental/constatnts.dart';
import 'package:car_rental/models.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';
import 'package:car_rental/singleton.dart';
import 'card_details_widgets/grid_info.dart';
import 'card_details_widgets/images_slider.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({Key? key, this.recibirDatos}) : super(key: key);

  final AutosModel? recibirDatos;

  @override
  Widget build(BuildContext context) {
    final screerSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: appBar(context, titulo: "الموصفات"),
          body: ListView(
            children: [
              _mitadSuperior(
                  altura: screerSize.height,
                  context: context,
                  recibirDatos: recibirDatos!),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPaddingSmall),
                child: rentalInfo(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPaddingBig),
                child: botonGenerico(
                    titulo: 'استئجار',
                    onPress: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (builder) => ConfirmationPage(
                                  recibirDatos: recibirDatos!)));
                    }),
              ),
              SizedBox(
                height: kPaddingBig,
              )
            ],
          )),
    );
  }
}

Widget _mitadSuperior({altura, context, required AutosModel recibirDatos}) {
  final _servicio = ServicioSingleton();

  return Container(
    padding: EdgeInsets.all(kPaddingSmall),
    decoration: BoxDecoration(
        color: kYellow,
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(kRadiusBig))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImagesSlider(
          recibirDatos: recibirDatos,
        ),
        Text('${recibirDatos.marca} ${recibirDatos.modelo}',
            style: TextStyle(
                color: kWhite,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.5)),
        Container(
          height: 100,
          margin: EdgeInsets.symmetric(vertical: kPaddingSmall),
          alignment: Alignment.center,
          child: GridView.count(
            semanticChildCount: 2,
            crossAxisCount: 3,
            childAspectRatio: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: [
              infoGrid(
                  info: '${recibirDatos.maletas.toString()} حقائب',
                  icon: Icons.cases),
              infoGrid(
                  info: '${recibirDatos.asientos.toString()} المقاعد',
                  icon: Icons.event_seat),
              infoGrid(
                  info: '${recibirDatos.valoracion.toString()} التقييم',
                  icon: Icons.star),
              infoGrid(
                  info: '${recibirDatos.xmodel.toString()} الموديل',
                  icon: Icons.car_repair),
              infoGrid(
                  info: '${recibirDatos.velocidad.toString()} كم/س',
                  icon: Icons.speed),
                  
              GestureDetector(
                  onTap: () {},
                  child: infoGrid(info: 'التفاصيل ', icon: Icons.more_horiz)),
            ],
          ),
        ),
        SizedBox(
          height:10 ,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text('السعر باليوم: \SAR ${recibirDatos.precio}',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ))),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
                'إجمالي المدفوعات ${_servicio.diasTOTALES} أيام: SAR ${recibirDatos.precio! * _servicio.diasTOTALES}',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ))),
        SizedBox(
          height: kPaddingSmall,
        )
      ],
    ),
  );
}
