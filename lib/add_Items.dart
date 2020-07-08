import 'package:flutter/material.dart';

class AddItems extends StatefulWidget{

 final Function addedItem ;
 AddItems(this.addedItem);

   @override
  _AddNewItems createState() => _AddNewItems();
}

class _AddNewItems extends State<AddItems>{

  final _nameController  = TextEditingController() ;
  DateTime _selectedDate ;

 void addedItem() {

   final enteredItem =  _nameController.text;

   if(enteredItem.isEmpty && enteredItem == null ) {
     return;
   }

   widget.addedItem(
      enteredItem,
   );

  Navigator.of(context).pop();

 }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child:Column(children: <Widget>[
        TextField(decoration: InputDecoration(labelText:'Add an Item'),
        style: TextStyle(fontSize:20 , fontWeight:FontWeight.bold),
         controller: _nameController,
         onSubmitted: (_) => addedItem(),
         ),
       //  Text('${}'),
        RaisedButton(child: Text('submit'),
        onPressed: addedItem ,
        ),
      ],),
    );
  }
}

