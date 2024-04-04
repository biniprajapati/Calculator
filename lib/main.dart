import 'package:flutter/material.dart';
import 'components/roundbutton.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var Userinput='';
  var answer='';
  var error='';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child:Column(

            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top:20, right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                          child: Text(Userinput.toString(),textAlign: TextAlign.right,style: TextStyle(fontSize: 24,color:Colors.white,))),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:20, right: 20),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(answer.toString(),style: TextStyle(fontSize: 36,color: Colors.white,fontWeight: FontWeight.bold),),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:20, right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: error==''?Text(error.toString(),style: TextStyle(fontSize: 24,color: Colors.red,fontStyle: FontStyle.italic),):AnimatedTextKit(totalRepeatCount: 100,animatedTexts: [
                          TypewriterAnimatedText(error,textStyle: TextStyle(fontSize: 24,color: Colors.red,fontWeight: FontWeight.bold)),
                        ]),),
                    ),

                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        RoundButton(text:'A/C', func:(){
                          Userinput='';
                          answer='';
                          error='';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'ANS', func: (){
                          if(answer=='')
                            {
                              Userinput='0';
                            }
                          else
                            {
                              Userinput=answer;
                            }
                          answer='';

                          setState(() {

                          });

                        }),
                        RoundButton(text:'%', func: (){
                          Userinput+='%';
                          setState(() {

                          });

                        }),
                        RoundButton(text:'/', func: () {
                          Userinput+='/';
                          setState(() {

                          });
                        },color: Colors.orange),


                      ],
                    ),
                    Row(
                      children: [
                        RoundButton(text:'7', func: (){
                          Userinput+='7';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'8', func: (){
                          Userinput+='8';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'0', func: (){
                          Userinput+='0';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'x', func: (){
                          Userinput+='x';
                          setState(() {

                          });
                        },color: Colors.orange),


                      ],
                    ),
                    Row(
                      children: [
                        RoundButton(text:'4', func: (){
                          Userinput+='4';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'5', func: (){
                          Userinput+='5';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'6', func: (){
                          Userinput+='6';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'-', func: (){
                          Userinput+='-';
                          setState(() {

                          });
                        },color: Colors.orange),


                      ],
                    ),

                    Row(
                      children: [
                        RoundButton(text:'1', func: (){
                          Userinput+='1';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'2', func: (){
                          Userinput+='2';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'3', func: () {
                          Userinput+='3';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'+', func: (){
                          Userinput+='+';
                          setState(() {

                          });
                        },color: Colors.orange),


                      ],
                    ),
                    Row(
                      children: [
                        RoundButton(text:'0', func: (){
                          Userinput+='0';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'.', func: (){
                          Userinput+='.';
                          setState(() {

                          });
                        }),
                        RoundButton(text:'DEL', func: (){
                          Userinput=Userinput.substring(0,Userinput.length-1);
                          setState(() {

                          });
                        }),
                        RoundButton(text:'=', func: (){
                          equalPress();
                          setState(() {

                          });
                        },color: Colors.orange),


                      ],
                    )
                  ],
                ),
              ),

            ],
          )


        ),
      ),
    );
  }
  void  equalPress()
  {
    bool flag=false;
    try{
      Userinput=Userinput.replaceAll('x','*');
      Parser p = Parser();
      Expression e=p.parse(Userinput);
      ContextModel cm= ContextModel();
      double ans=e.evaluate(EvaluationType.REAL, cm);
      print(ans);
      answer=ans.toString();

    }
    catch(Exception )
  {
    flag=true;
    print(FormatException('Math Error'));
    error='Math Error';

  }

    if(!flag)
      {
        error='';
      }
    Userinput=Userinput.replaceAll('*','x');

  }
}




