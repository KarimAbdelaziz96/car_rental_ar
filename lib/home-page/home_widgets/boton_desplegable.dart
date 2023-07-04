import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../models.dart';
import '../../singleton.dart';

class BotonDesplegable extends StatefulWidget {
  BotonDesplegable();

  @override
  _BotonDesplegableState createState() => _BotonDesplegableState();
}

class _BotonDesplegableState extends State<BotonDesplegable> {
  List<String> dropdownValue = ciudades;
  String? mostrarValor;
  String? selectedValue;

  final _servicio = new ServicioSingleton();

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      isExpanded: true,
      hint: const Row(
        children: [
          Icon(
            Icons.list,
            size: 16,
            color: Colors.white,
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              'اختر المدينة',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      items: ciudades
          .map((String ciudades) => DropdownMenuItem<String>(
                value: ciudades,
                child: Text(
                  ciudades,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          mostrarValor = value;
          _servicio.destino = value!;
          print('destino::: $mostrarValor'); //destino elegido
          print('destino singletone::: ${_servicio.destino}');

          selectedValue = value;
        });
      },
      buttonStyleData: ButtonStyleData(
        height: 40,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:Colors.amber.withOpacity(0.2),
          ),
             boxShadow: [
          BoxShadow(
            color:Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
          color: Color(0xff0125E1).withOpacity(0.2),
        ),
        elevation: 0,
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        iconSize: 14,
        iconEnabledColor: Colors.white,
        iconDisabledColor: Colors.grey,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff0125E1).withOpacity(0.2),
            border: Border.all(color: Colors.amber.withOpacity(0.4))),
        offset: const Offset(-20, 0),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(40),
          thickness: MaterialStateProperty.all(6),
          thumbVisibility: MaterialStateProperty.all(true),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
        padding: EdgeInsets.only(left: 25, right: 25),
      ),
    );
  }
}
