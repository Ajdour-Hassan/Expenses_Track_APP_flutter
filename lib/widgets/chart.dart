import 'package:flutter/material.dart';
import 'package:trackerApp/models/Items.dart';
import 'package:intl/intl.dart' ;
import './chart.bar.dart' ;

class Chart extends StatelessWidget {

 final List<Items> latestTransiction ;

 Chart(this.latestTransiction) ;

  List<Map<String , Object>> get eveydayTransictionValue {
   //crate geneter inside a map

   return List.generate(7, (index) {

     final weekday = DateTime.now().subtract(Duration(days:index),);
     double totalOfExpenses = 0.0 ;

     for (var i = 0 ; i < latestTransiction.length ; i = i + 1 ) {

       if (latestTransiction[i].date.day == weekday.day &&
           latestTransiction[i].date.month == weekday.month  &&
           latestTransiction[i].date.year == weekday.year) {
           totalOfExpenses =   totalOfExpenses + latestTransiction[i].amount ;
          //  totalOfExpenses +=  latestTransiction[i].amount ;
          }
     }
     // return to map here !
    return {'day': DateFormat.E().format(weekday).substring(0, 1) ,
           'amount' : totalOfExpenses};
   
   }).reversed.toList();
 }

 // crate new getter to calculate a total of sprnding money!
 double get spentAmountTotal {
  //  creaat a fun with a starting valUe 0.0 : take two argument!
  return eveydayTransictionValue.fold(0.0, (sum, item ) {
    return sum + item ['amount'] ;
   });
 }


  @override
  Widget build (BuildContext context) {
    return /*Container(
      height: MediaQuery.of(context).size.height * 0.4 ,
      child: */ Card(
      margin : EdgeInsets.all(15) ,
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(10),
      child : Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: eveydayTransictionValue.map((dayItem) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(dayItem['day'] ,
                            dayItem['amount'] , spentAmountTotal == 0.0 ? 0.0 :
                          (dayItem['amount'] as double ) / spentAmountTotal,),
          );
        }).toList(),

    ),
    ),
    );
  }
}


