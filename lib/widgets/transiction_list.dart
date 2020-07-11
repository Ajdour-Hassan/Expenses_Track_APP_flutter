import 'package:flutter/material.dart' ;
import 'package:intl/intl.dart';
import '../models/transiction.dart';


class TranslationList extends StatelessWidget {

  final List<Transiction> transiction ;
  final Function deleteTransiction ;

  TranslationList(this.transiction , this.deleteTransiction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transiction.isEmpty ? Column(children: <Widget>[
      Text('No Task Added yet! Click to add a new Task', style: TextStyle(fontSize:20,)),
      Image.asset('assets/images/introVideo.png'),
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
            child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                child: Text('${transiction[index].amount.toStringAsFixed(2)}\$'),
              ),
            ),
            ),

           title: Text(transiction[index].name ,
                  style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),
                  ),
            subtitle :  Text(DateFormat.yMMMd().format(transiction[index].date),),
            trailing: IconButton(icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: () => deleteTransiction(transiction[index].id),
            ),
          ),
          );
        },
        itemCount: transiction.length,
        ),
      );
  }
}
