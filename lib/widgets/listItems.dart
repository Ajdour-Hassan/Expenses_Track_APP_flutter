import 'package:flutter/material.dart' ;
import 'package:intl/intl.dart';
import '../models/Items.dart';


class ItemList extends StatelessWidget {

  final List<Items> itemlist ;
  final Function deleteItem ;

  ItemList(this.itemlist , this.deleteItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.6 ,
      child: itemlist.isEmpty ? 
      LayoutBuilder(builder: (ctx , constraints) {
        return Column(children: <Widget>[
        Text('No Task Added yet! Click to add a new Task', style: TextStyle(fontSize:20,)),
        Container (
        height: constraints.maxHeight * 0.6 ,
        child:  Image.asset('assets/images/introVideo.png' , fit: BoxFit.cover,)
        ),
      ],);
      })
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
                child: Text('${itemlist[index].amount.toStringAsFixed(2)}\$'),
              ),
            ),
            ),

           title: Text(itemlist[index].name ,
                  style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),
                  ),

            subtitle :  Text(DateFormat.yMMMd().format(itemlist[index].date),),

            trailing: IconButton(icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: () => deleteItem(itemlist[index].id),
            ),
          ),
          );
        },
        itemCount: itemlist.length,
      ),
    );
  }
}
