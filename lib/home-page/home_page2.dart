import 'package:car_rental/calendar_page/calendar_page.dart';
import 'package:car_rental/constatnts.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';
import 'package:car_rental/singleton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_widgets/boton_desplegable.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _servicio = new ServicioSingleton();
    final _screen = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(kPaddingBig),
              color: kYellow,
              width: double.infinity,
              height: _screen.height / 2.2,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ]),
                        child: CarouselSlider(
                            items: ImageIntro,
                            options: CarouselOptions(
                                height: 250,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 1,
                                enableInfiniteScroll: true,
                                reverse: true,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.bounceInOut,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                // onPageChanged: callbackFunction,
                                scrollDirection: Axis.horizontal)),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'مرحبا بك في',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Text(
                        ' لتاجير السيارات......',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'استئجار سيارة لرحلتك القادمة!',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          height: 1,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اختر مدينة',
                    style:
                        TextStyle(color: kWhite, fontWeight: FontWeight.w400),
                  ),
                  BotonDesplegable(),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: botonGenerico(
                        titulo: 'متابعة',
                        onPress: () {
                          _servicio.destino == ''
                              ? ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                    'حدد وجهة للمتابعة',
                                    textAlign: TextAlign.center,
                                  ),
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.all(16),
                                ))
                              : Navigator.of(context)
                                  .push(CupertinoPageRoute(builder: (context) {
                                  return CalendarPage();
                                }));
                        }),
                  ),
                
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
