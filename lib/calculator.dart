import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
    Widget numBottom(String btnText , Color btnColor,Color textColor){
      return ElevatedButton(
        style:ElevatedButton.styleFrom(
          fixedSize: Size(70, 70),
          shape: CircleBorder() ,
          backgroundColor: btnColor,
        ) ,
        onPressed: ()=>caluclate(btnText),
          child: Text(
            btnText ,
            style: TextStyle(fontSize: 25 , color: textColor),
          )
      );
    }
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Calculator'), centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                        child: Text(text , textAlign: TextAlign.left,
                          style: TextStyle(color :Colors.white , fontSize: 90),),



                      ),
                    )
                  ],
                ) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numBottom('C' , Colors.grey , Colors.black),
                    numBottom('+/-' , Colors.grey , Colors.black),


                    numBottom('%' , Colors.grey , Colors.black),

                    numBottom('/' , Colors.orange , Colors.white),
                  ],
                ),
                SizedBox(height: 10,) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numBottom('7' , (Colors.grey[850])! , Colors.white),
                    numBottom('8' ,(Colors.grey[850])! , Colors.white),


                    numBottom('9' ,(Colors.grey[850])! , Colors.white),

                    numBottom('x' , Colors.orange , Colors.white),
                  ],
                ),
                SizedBox(height: 10,) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numBottom('4' , (Colors.grey[850])! , Colors.white),
                    numBottom('5' , (Colors.grey[850])! , Colors.white),


                    numBottom('6' , (Colors.grey[850])! , Colors.white),

                    numBottom('-' , Colors.orange , Colors.white),
                  ],
                ),
                SizedBox(height: 10,) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numBottom('1' , (Colors.grey[850])! , Colors.white),
                    numBottom('2' , (Colors.grey[850])! , Colors.white),


                    numBottom('3' , (Colors.grey[850])! , Colors.white),

                    numBottom('+' , Colors.orange , Colors.white),
                  ],
                ),
                SizedBox(height: 10,) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton
                      (onPressed: ()=>caluclate('0'),
                        child: Padding(
                      
                          padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
                          child: Text('0' , style: TextStyle(fontSize: 35  , color: Colors.white),),
                        ) ,
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: (Colors.grey[850])! ,
                      ),
                      
                    ) ,
                    numBottom('.', (Colors.grey[850])!, Colors.white),
                    numBottom('=', (Colors.grey[850])!, Colors.white)
                  ],
                ) ,
                SizedBox(height: 10,) ,

              ],),
          ),


    ),
      );
  }

  //Logic

    int firstNumber = 0 ;
    int secondNumber =0;
    String result = '' ;
    String text = '' ;
    String operation='';

  void caluclate(String btnText) {
    if(btnText=='C'){
      result = "";
      text = "";
      firstNumber = 0;
      secondNumber = 0;}
    else if (btnText=='+' ||btnText=='-' ||btnText=='x' || btnText=='/'){
      firstNumber = int.parse(text);
      result='';
      operation=btnText ;
    }else if (btnText=="=") {
      secondNumber = int.parse(text);
      if(operation=='+'){
        result = (firstNumber+secondNumber).toString();
      }
       if(operation=='-'){
        result = (firstNumber-secondNumber).toString();
      } if(operation=='x'){
        result = (firstNumber*secondNumber).toString();
      }
       if(operation=='/'){
        result = (firstNumber/secondNumber).toString();
      }}
       else{
      result = int.parse(text + btnText).toString();
       }
       setState(() {
         text=result;
       });

    }
  }

