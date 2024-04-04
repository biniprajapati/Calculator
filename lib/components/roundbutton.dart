import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {

  RoundButton({Key? key, required this.text,  required this .func,this.color=Colors.grey}):super(key:key);
  String text;
  Function() func;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: func,
        child: Container(
          padding: EdgeInsets.all(8.0),
          height: 80,

        child:CircleAvatar(

                child: Text(text,style: TextStyle(fontSize: 19,color: Colors.white),),
                backgroundColor: color ,
              )
          ),
      ),
      
    );
  }
}