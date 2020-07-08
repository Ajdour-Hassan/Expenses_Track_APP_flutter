import 'package:flutter/material.dart';
import 'package:intl/intl.dart' ;
import './items.dart';
import './add_Items.dart';
import './itemsList.dart' ;
import './chart.dart' ;

void main() => runApp(MeinTaskApp());


class MeinTaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_HomePage> {


  final List<Items> _itemlist = [
    Items(
        name : 'Hang out with Crash',
        time : DateTime.now(),
        id :  DateTime.now().toString(),
    ),

    Items(
        name : 'Hang out with Freeinds',
        time : DateTime.now(),
        id :  DateTime.now().toString(),
    ),
  ];

// Add Item function
void _itemAdd(String addTask) {
  final _addItem = Items(
    name: addTask ,
    time :  DateTime.now(),
    id :  DateTime.now().toString(),
  );
  setState(() {
       _itemlist.add(_addItem);
  });
}

// Adding item function to Icons => Add(FloatingAcctionButton)
void startAddingItem(BuildContext context) {
  showModalBottomSheet(context: context , builder : (_) {
    return GestureDetector(
      child: AddItems(_itemAdd),
      onTap : () {} ,
      behavior: HitTestBehavior.opaque,
    );
  },
  );
}


// delete item based on its ID
void _deletedItem(String id) {
    setState(() {
      _itemlist.removeWhere((element) {
        return element.id == id ;
      });
    });
}

/*  edit item
void editItem( String editedItem) {
  final _itemedit = Items (
    name : editedItem ,
    time : DateTime.now() ,
    id : DateTime.now().toString() ,
  );

  setState(() {
    _itemlist.clear;
  });

} */



  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('MeinApp'),
        actions: <Widget>[
          IconButton( icon: Icon(Icons.add),
           onPressed: () => startAddingItem(context))
        ],
        ),
        body: SingleChildScrollView(
        child : Column(
           crossAxisAlignment : CrossAxisAlignment.stretch,
           children: <Widget>[
         // ChartItem(),
          ItemsList(_itemlist , _deletedItem),
        ],)
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_box),
          onPressed :() => startAddingItem(context),
        ),
      );
  }
}
