import 'package:car_rental/constatnts.dart';
import 'package:car_rental/pay_page/pay_widgets/card_name.dart';
import 'package:car_rental/pay_page/pay_widgets/codigo.dart';
import 'package:car_rental/pay_page/pay_widgets/dni.dart';
import 'package:car_rental/pay_page/pay_widgets/numero_de_tarjeta.dart';
import 'package:car_rental/pay_page/pay_widgets/pay_buttons.dart';
import 'package:car_rental/pay_page/pay_widgets/vencimiento.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';
import 'package:car_rental/ultima_pagina/ultima_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayPage extends StatefulWidget {
  const PayPage({Key ?key}) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {

  bool acepto = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: appBar( context, titulo: 'ادفع',),

      body: Padding(
        padding: const EdgeInsets.all(kPaddingSmall),

        child: SingleChildScrollView(

          child: Column(
            children: [       

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  PayButtons(),
                  SizedBox(height: kPaddingSmall,),
                  NumeroDeTarjeta(),
                  SizedBox(height: kPaddingSmall,),                  
                  NombreCompleto(),
                  SizedBox(height: kPaddingSmall,),
                  // DNI(),
                  SizedBox(height: kPaddingSmall,),
                  Row(
                    children: [
                       FechaVencimiento(),
                  CodigoTarjeta(),

                    ],
                  ),
                 
                  SizedBox(height: kPaddingSmall,),
                ],
              ),

              ///////////// acepto terminos
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox( 
                    fillColor: MaterialStatePropertyAll(kWhite),
                    checkColor: kBlack,
                    value: acepto,
                    onChanged: (data) {
                      setState(() {
                        acepto = data!;
                        print('بيانات $data');
                        print('أنا موافق $acepto');
                      });
                    }
                  ),
                  Text('موافق على الشروط والأحكام',
                  style: TextStyle(
                    color: kWhite
                  ),
                  )
                ], 
              ),
              
              /////////// botonardo continuar
              botonGenerico( 
                titulo: 'الدفع والمتابعة',
                bgColor: acepto == false ? Color(0xff0125E1).withOpacity(0.1) : Colors.grey.withOpacity(0.2) ,
                onPress: (){
                  acepto == false ?
                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: Text('قبول الشروط للمتابعة', textAlign: TextAlign.center,),
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(16),
                    )
                  ) :
                  Navigator.push(context, CupertinoPageRoute(builder: (builder) =>UltimaPagina()));
                  //Navigator.pushNamed(context, '/ultimaPagina');
                }  
              ) 
            ],
          ),
        ),
      )
    );
  }
}



