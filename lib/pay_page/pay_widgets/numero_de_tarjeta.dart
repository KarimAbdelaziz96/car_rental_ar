import 'package:car_rental/constatnts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumeroDeTarjeta extends StatefulWidget {
  const NumeroDeTarjeta({
    Key? key,
  }) : super(key: key);

  @override
  _NumeroDeTarjetaState createState() => _NumeroDeTarjetaState();
}

class _NumeroDeTarjetaState extends State<NumeroDeTarjeta> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final clear = IconButton(
        onPressed: () {
          _controller.clear();
        },
        icon: Icon(
          Icons.close,
          color: kDarkGrey,
        ));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'رقم البطاقة',
          style: TextStyle(color: kWhite, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kPaddingSmallSmall),
          child: TextField(
            style: TextStyle(
              color: kWhite
            ),
              controller: _controller,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                new CardNumberInputFormatter(),
              ],
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                suffix: Icon(Icons.payment_outlined,
                color: kWhite,),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: kWhite
                  ),
                  
                  
                ),
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.white,
                    
                  )

                ),
              
                counterStyle: TextStyle(color: kWhite),
                hintText: '0000 0000 0000 0000',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3)),
              )
            
              ),
        )
      ],
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();

    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
