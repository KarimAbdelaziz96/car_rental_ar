import 'package:car_rental/constatnts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

class NombreCompleto extends StatefulWidget {

  const NombreCompleto({
    Key? key,
  }) : super(key: key);

  @override
  _NombreCompletoState createState() => _NombreCompletoState();
}

class _NombreCompletoState extends State<NombreCompleto> {

  final _controller = TextEditingController();

  @override
  void initState() { 
    super.initState();
    _controller.addListener((){
      setState(() { });
    });        
  }

  @override
  Widget build(BuildContext context) {

    final clear = IconButton(onPressed: (){ _controller.clear(); }, icon: Icon(Icons.close, color: kDarkGrey,));

    return
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( 'الاسم كامل', style: TextStyle(
          fontWeight: FontWeight.bold,
          color: kWhite
          ),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kPaddingSmallSmall),
          child: TextField(
            style: TextStyle(
              color: kWhite
            ),
            controller: _controller,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            decoration:InputDecoration(
              suffix:Icon(Icons.person,
              color: kWhite,),
              
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: kWhite
                )
              ),
              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: kWhite
                )
              ),

              hintText:'الاسم كامل',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.2),
                
              )
            )
            
          ),

        ),
      ],
    );
  }
}