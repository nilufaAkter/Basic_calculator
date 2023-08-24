import 'package:flutter/material.dart';

class customwidget extends StatefulWidget {
   customwidget({super.key});

  @override
  State<customwidget> createState() => _customwidgetState();
}

class _customwidgetState extends State<customwidget> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  TextEditingController _textEditingController = TextEditingController();

  // Function to handle button press and update the text
  void _handleButtonPress(String buttonText) {
    setState(() {
      _textEditingController.text += buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 50),
      child: TextFormField(
        decoration: InputDecoration(border: InputBorder.none),
        textAlign: TextAlign.right,
        controller: _textEditingController,
        style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.w700, fontStyle:FontStyle.normal,
          fontFamily:'Helvetica',color: Colors.white, ),
        readOnly: true,
        autofocus: true,
        showCursor: true,
        cursorColor: Colors.white,
      ), );



  }
}
