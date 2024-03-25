import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}
String s = '0';
String result = '0';
String expression = "";

class _CalculatorPageState extends State<CalculatorPage> {
  Widget button(String num, Color txtcolor, Color btncolor) {
    void tapbutton(String num) {
      setState(() {
        if (num == 'AC') {
          s = '0';
          result = '0';
        } else if (num == '=') {
          Parser p = Parser();
          Expression exp = p.parse(s);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } else if (num == 'ERS') {
          s = s.substring(0, s.length - 1);
        } else {
          if (s == '0') {
            s = num;
          } else {
            s = s + num;
          }
        }
      });
    }

    return TextButton(
      onPressed: () => tapbutton(num),
      child: Container(
          height: 60,
          width: 60,
          margin: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          color: btncolor,
          child: Center(
              child: Text(
            num,
            style: TextStyle(color: txtcolor, fontSize: 20),
          ))),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("CALCULATOR",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(s,style: TextStyle(color: Colors.white30,fontSize: 35),),
              Padding(padding: EdgeInsets.only(left: 48)),
            ],
          ),
          SizedBox(
            height: 25,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
               Text(
                result,
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
              Padding(padding: EdgeInsets.only(left: 45)),
            ],
          ),
          SizedBox(height: 15,),



          //buttons
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                button('AC', Colors.white, Colors.grey),
                button('ERS', Colors.white, Colors.grey),
                button('%', Colors.white, Colors.grey),
                button('/', Colors.white, Colors.orange),  
              ],
                       ),
             SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              button('7', Colors.white, Colors.grey),
              button('8', Colors.white, Colors.grey),
              button('9', Colors.white, Colors.grey),
              button('*', Colors.white, Colors.orange),
            ],
           ),
           SizedBox(height: 10,),
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              button('4', Colors.white, Colors.grey),
              button('5', Colors.white, Colors.grey),
              button('6', Colors.white, Colors.grey),
              button('-', Colors.white, Colors.orange),
            ],
          ),
          SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              button('1', Colors.white, Colors.grey),
              button('2', Colors.white, Colors.grey),
              button('3', Colors.white, Colors.grey),
              button('+', Colors.white, Colors.orange),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => tap('0'),
                child: Container(
                  height: 60,
                  width: 150,
                  color: Colors.grey,
                  child: Center(
                    child: Text("0",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              button('.', Colors.white, Colors.grey),
              button('=', Colors.white, Colors.blue),
              
            ],
          ),
        ],
      ),
    );
  }
  void tap(String num)
      {
        setState(() {
          s=num;
        });
      }
  }