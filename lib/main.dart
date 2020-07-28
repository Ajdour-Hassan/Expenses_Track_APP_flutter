import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/add_NewItem.dart';
import 'models/Items.dart';
import 'widgets/listItems.dart';
import 'widgets/chart.dart';



void main() {
/*
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,

  ]);
  */
  runApp(MyApp()) ;
}

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

final List<Items> _userTransictions = [
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

  bool _showChart = true;

 

// add item method
void _addItem (String newtitle , double newamount , DateTime chosenDate) {
    final newItem = Items(
       name : newtitle ,
       amount : newamount ,
       date : chosenDate ,
       id : DateTime.now().toString(),
    );

    setState(() {
      _userTransictions.add(newItem);
    });

  }

// pass Function to Add_Button!
void _startAddItem(BuildContext itemContext) {
    showModalBottomSheet(context: itemContext,  builder: (_) {
      return  GestureDetector(
          child: NewTransiction(_addItem),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
      );
   },);
}

 // detete item based on Item_id .
  void _deleteItem(String id) {
    setState(() {
      _userTransictions.removeWhere( (element) {
           return element.id == id ;
      });
    });
  }


  List<Items> get _latestTranscition {
    return _userTransictions.where( (dateFilter) {
      return dateFilter.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
    }).toList();
  }


@override
Widget build(BuildContext context) {
  final landscape = MediaQuery.of(context).orientation == Orientation.landscape;
  final appBar = AppBar(title: Text('TrackerApp'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add) ,
          onPressed: () => _startAddItem(context),
         ),
      ],
      );
      
  final listWidget = Container(
            height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7 ,
            child: ItemList(_userTransictions , _deleteItem),
            );
  final chartItem = Container(
            height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.3 ,
            child: Chart(_latestTranscition),
            ) ;
    return Scaffold(
    appBar: appBar ,
    body: SingleChildScrollView (
      child: Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          /*landscape ? = */  if (landscape) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text("Show Chart"),
              Switch(value: _showChart , onChanged: (val) {
                  setState(() {
                     _showChart = val;
                  });
              }),
            ],),
            // if _showChart is true show us Chart , if not show us only the ItemList
           /* landscape !? == */
           if(!landscape) listWidget,
           if(landscape) _showChart ?
             chartItem :
             listWidget,
           ],),
       ),
     //s  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: () => _startAddItem(context) ,),
      );
    }
}




