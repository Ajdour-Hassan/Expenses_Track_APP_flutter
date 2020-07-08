import 'package:flutter/material.dart';
import 'package:intl/intl.dart' ;
import './items.dart' ;

class ItemsList extends StatelessWidget {

 final List<Items> itemlist;
 final Function deleteitem;
 //final Function editItem ;


  ItemsList(this.itemlist , this.deleteitem );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: itemlist.isEmpty ? Column(children: <Widget>[
      Text('No Task Added yet! Click to add a new Task', style: TextStyle(fontSize:20,)),
      ],)
      : ListView.builder(
        // displaying as much as of lists below
        itemBuilder: (context , index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 5 , horizontal: 8 ),
            child:  ListTile(
            leading: CircleAvatar(
            radius: 30,
            child:  Container (
              padding : EdgeInsets.all(7),
              child: FittedBox(
                child: IconButton(icon: Icon(Icons.dehaze) ,
                onPressed: () {} ,
              ),
              ),
            ),
            ),

           title: Text(itemlist[index].name , style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),
           ),
          subtitle :  Text(DateFormat.yMMMd().format(itemlist[index].time),
          ),

          trailing: IconButton(icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: () => deleteitem(itemlist[index].id),
            ),
          ),
          );
        },
        itemCount: itemlist.length,
        ),
      );
  }
}