import 'package:assignment_3/button.dart';
import 'package:flutter/material.dart';
import 'calculateButton.dart';
import 'package:math_expressions/math_expressions.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  static const Color myColor = Color(0xFF213B4F);
  static const Color primaryColor = Color(0xFF154C79);
  double result = 0.0;
  List<double> numbers = [];
  List<String> operations = [];
  String history = '';
  String textToDisplay = '';
  String? operation;
  bool isCalculationCompleted = false;

  void onButtonClick(String value) {
    try {
      if (value == 'c') {
        clearAll();
      } else if (value == 'x') {
        removeLast();
      } else if (value == '=') {
        calculate();
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        handleOperator(value);
      } else if (value == '%') {
        handlePercent();
      } else if (value == '.') {
        handleDecimal();
      } else if (value == '(' || value == ')') {
        handleBracket(value);
      } else {
        handleNumericInput(value);
      }

      // Update history after each button press
      setState(() {
        history = generateHistory();
      });
    } catch (e) {
      // Handle any unexpected errors here
      print("An error occurred: $e");
    }
  }

  String generateHistory() {
    String history = '';
    for (int i = 0; i < numbers.length; i++) {
      history += numbers[i].toString();
      if (i < operations.length) {
        history += ' ' + operations[i] + ' ';
      }
    }
    return history;
  }


  void clearAll() {
    setState(() {
      result = 0.0;
      numbers.clear();
      operations.clear();
      textToDisplay = '';
      isCalculationCompleted = false;
    });
  }


  void removeLast() {
    setState(() {
      if (textToDisplay.isNotEmpty) {
        textToDisplay = textToDisplay.substring(0, textToDisplay.length - 1);
      }
    });
  }

  void handleOperator(String operator) {
    if (textToDisplay.isNotEmpty) {
      setState(() {
        numbers.add(double.parse(textToDisplay));
        operations.add(operator);
        history = generateHistory(); // Update history with the full equation
        textToDisplay = ''; // Clear textToDisplay
        isCalculationCompleted = false;
      });
    }
  }

  void calculate() {
    if (textToDisplay.isNotEmpty && operations.isNotEmpty) {
      numbers.add(double.parse(textToDisplay));

      double result = numbers[0];

      for (int i = 0; i < operations.length; i++) {
        String operator = operations[i];
        double nextNumber = numbers[i + 1];

        if (operator == '+') {
          result += nextNumber;
        } else if (operator == '-') {
          result -= nextNumber;
        } else if (operator == '*') {
          result *= nextNumber;
        } else if (operator == '/') {
          if (nextNumber != 0) {
            result /= nextNumber;
          } else {
            print("Error: Division by zero");
            return;
          }
        }
      }

      setState(() {
        //operations.clear();
        //numbers.clear();
        textToDisplay = result.toString();
        history = generateHistory(); // Update history with the full equation
        isCalculationCompleted = true;

        print("Updated textToDisplay: $textToDisplay");
        print("Updated history: $history");
      });

    }
  }
  void handleBracket(String value) {

  }


  void handlePercent() {
    if (textToDisplay.isNotEmpty) {
      double percentValue = double.parse(textToDisplay) / 100;
      setState(() {
        textToDisplay = percentValue.toString();
      });
    }
  }

  void handleDecimal() {
    if (!textToDisplay.contains('.')) {
      setState(() {
        textToDisplay += '.';
      });
    }
  }



  void handleNumericInput(String value) {
    if (isCalculationCompleted) {
      setState(() {
        textToDisplay = value;
        isCalculationCompleted = false;
      });
    } else {
      setState(() {
        textToDisplay += value;
      });
    }
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: myColor,
      appBar: AppBar(
        title:  Padding(

          padding: EdgeInsets.only(top: 16.0),

          child: Text("Calculator",style:TextStyle(fontSize: 19,
            fontWeight: FontWeight.w700, fontStyle:FontStyle.normal,
            fontFamily:'Helvetica',color: Colors.white,

            ),),
        ),
           centerTitle: true,
         backgroundColor:myColor ,
        ),
      body:  Column(
        children: [
          SizedBox(height: 30,),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 25, 10),
            child: Text(history, style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.w700, fontStyle:FontStyle.normal,
              fontFamily:'Helvetica',color: Colors.white,),),
          ),

          Spacer(),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 25, 10),
            child: Text(textToDisplay, style: TextStyle(fontSize: 35,
              fontWeight: FontWeight.w700, fontStyle:FontStyle.normal,
              fontFamily:'Helvetica',color: Colors.white,),),
          ),

          SizedBox(height: 30,),

         Container(
        height: MediaQuery.sizeOf(context).height*0.5,
        width:  double.infinity,
        padding: EdgeInsets.only(top:10,left: 15, ),
        decoration: BoxDecoration(color: primaryColor),
        child:Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonOne(text: "v", onButtonPressed: onButtonClick,),
                buttonOne(text: "c",onButtonPressed: onButtonClick,),
                buttonOne(text: "x",onButtonPressed: onButtonClick,),
                buttonOne(text: "/",onButtonPressed: onButtonClick,),

              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonOne(text: "(",onButtonPressed: onButtonClick, ),
                buttonOne(text: ")",onButtonPressed: onButtonClick, ),
                buttonOne(text: "%", onButtonPressed: onButtonClick,),
                buttonOne(text: "*",onButtonPressed: onButtonClick, ),

              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonOne(text: "1",onButtonPressed: onButtonClick,),
                buttonOne(text: '2',onButtonPressed: onButtonClick,),
                buttonOne(text: "3",onButtonPressed: onButtonClick,),
                buttonOne(text: "-",onButtonPressed: onButtonClick,),

              ],
                ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonOne(text: "4",onButtonPressed: onButtonClick,),
                buttonOne(text: "5",onButtonPressed: onButtonClick,),
                buttonOne(text: "6",onButtonPressed: onButtonClick,),
                buttonOne(text: "+",onButtonPressed: onButtonClick,),

              ],

            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buttonOne(text: "7",onButtonPressed: onButtonClick,),
                          buttonOne(text: "8",onButtonPressed: onButtonClick,),
                          buttonOne(text: "9",onButtonPressed: onButtonClick,),


                        ],

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buttonOne(text: "0",onButtonPressed: onButtonClick,),
                          buttonOne(text: "00",onButtonPressed: onButtonClick,),
                          buttonOne(text: ".",onButtonPressed: onButtonClick,),

                    ],

                  ),


                    ],


                  ),
                ),
                const SizedBox(
                  width: 15,
                ),

                calculateButton(onButtonPressed: onButtonClick, text: '=',),
              ],


            ),


          ],
        )
      ),
            ],
          )


    );
  }
}
