import 'package:flutter/material.dart' ;

class ChartItem extends StatelessWidget {
  @override
  Widget build(BuildContext  context) {
    return Column(children: <Widget>[
    Container (
      height: 400,
      margin: EdgeInsets.all(10),
      child: Text('days') ,
    ),

  SizedBox(height:4,),
  Container(
    child: Stack(children: <Widget>[
      Container (
        decoration: BoxDecoration(
          border: Border.all(color:Colors.grey , width: 0.2),
          color: Colors.white,
          borderRadius : BorderRadius.circular(20),
        ),
      ),
    ]),
    ),
    ]);
  }
}