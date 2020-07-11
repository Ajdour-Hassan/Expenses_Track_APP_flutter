import 'package:flutter/material.dart';
import './widgets/new_transiction.dart';
import './models/transiction.dart';
import 'widgets/transiction_list.dart';
import 'widgets/chart.dart';



void main() => runApp(MyApp()) ;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch:Colors.red , accentColor: Colors.green),
      home : _HomePage()
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {

final List<Transiction> _userTransictions = [
 /*    Transiction(
         id : 'ua' ,
         name : 'buying udemy courses' ,
         amount : 11.99 ,
         date : DateTime.now() ,

       ),

         Transiction(
         id : 'uai' ,
         name : 'buying clothes' ,
         amount : 20.99 ,
         date : DateTime.now() ,
       ), */
  ];

  List<Transiction> get _latestTranscition {
    return _userTransictions.where( (dateFilter) {
      return dateFilter.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
    }).toList();
  }

// add item method
void _addItem (String newtitle , double newamount , DateTime chosenDate) {
    final newItem = Transiction(
       name : newtitle ,
       amount : newamount ,
       date : chosenDate ,
       id : DateTime.now().toString(),
    );

    setState(() {
      _userTransictions.add(newItem);
    });

  }


void _startAddItem(BuildContext itemContext) {

    showModalBottomSheet(context: itemContext,  builder: (_) {
      return  GestureDetector(
          child:NewTransiction(_addItem),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
      );
   },);
} 

 // detelt item based on Item id .
  void _deleteItem(String id) {
    setState(() {
      _userTransictions.removeWhere( (transiction) {
           return transiction.id == id ;
      });
    });
  }



@override
Widget build(BuildContext context) {

    return Scaffold (
      appBar: AppBar(title: Text('TrackerApp'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add) ,
          onPressed: () => _startAddItem(context),
         ),
      ],
      ),

    body: SingleChildScrollView (
      child: Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_latestTranscition),
            TranslationList(_userTransictions , _deleteItem),
          ],)
       ),
     //s  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: () => _startAddItem(context) ,),
      );
    }
}




