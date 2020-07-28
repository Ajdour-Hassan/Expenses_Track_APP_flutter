import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class ChartBar extends StatelessWidget {

  final String label;
  final double spentAmount ;
  final double spendingAmountTotal ;

  ChartBar(this.label , this.spentAmount  , this.spendingAmountTotal);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx , constraints) {
      return Column(children: <Widget> [
    Container(
    height:  constraints.maxHeight * 0.15,
    child: FittedBox(
    child:Text('\$${spentAmount.toStringAsFixed(0)}'),
    ),
    ),
    SizedBox(
      height:  constraints.maxHeight * 0.05,
      ),
    Container (
      height: constraints.maxHeight * 0.6,
      width: 10,
      child: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width:1.0),
            color: Colors.white,
            borderRadius : BorderRadius.circular(20),
          ),
        ),

         FractionallySizedBox(
          heightFactor: spendingAmountTotal,
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor,
            borderRadius : BorderRadius.circular(10),
            ),
           ),
          ),
      ],)
    ),
    SizedBox(
      height:  constraints.maxHeight * 0.05,
    ),
    Container(
      height: constraints.maxHeight * 0.15 ,
      child:  FittedBox(
       child: Text(label),
      ),  
    ),
    ],
    );
    },);
  }
 }