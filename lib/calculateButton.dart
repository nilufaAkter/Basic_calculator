import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class calculateButton extends StatefulWidget {
  final Function(String) onButtonPressed;
  final String text;
  const calculateButton({super.key, required this.onButtonPressed, required this.text});

  @override
  State<calculateButton> createState() => _calculateButtonState();
}

class _calculateButtonState extends State<calculateButton> {

  @override
  Widget build(BuildContext context) {
    const Color equal = Color(0xFF56A7C5);
    return
      ElevatedButton(
        onPressed: () =>widget.onButtonPressed(widget.text),
        style: ElevatedButton.styleFrom(
          backgroundColor: equal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          minimumSize: Size(90, 140),
        ),
        child: Text(
          "=",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      );
  }
}






//       InkWell(
//       onTap:()=>widget.onButtonPressed("="),
//       child: Container(
//         height: 140,
//         width: 90,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(0),
//           color: equal,
//         ),
//         child: Center(
//           child: Text("=",style: TextStyle(fontSize: 25,color: Colors.white),),),
//       ),
//     );
//   }
// }
