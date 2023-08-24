import 'package:flutter/material.dart';

class buttonOne extends StatefulWidget {
   buttonOne({super.key,  required this.text, this.iconData, required this.onButtonPressed, });
    final String text;
   final IconData? iconData;
   final  Color myColor = Color(0xFF213B4F);
   final  Color primaryColor =Color(0xFF154C79);
   final Function(String) onButtonPressed;


  @override
  State<buttonOne> createState() => _buttonOneState();
}

class _buttonOneState extends State<buttonOne> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
                   onPressed:()=>widget.onButtonPressed(widget.text),
                      // Add your button functionality here


                    style:  ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
                     ),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );




  }
}


