import 'package:flutter/material.dart';
import 'package:intl/intl.dart' ;
//import 'package:flutter/services.dart';

class NewTransiction extends StatefulWidget {

  final Function addNewItem ;

  NewTransiction(this.addNewItem);

  @override
  _NewItemState createState() => _NewItemState();

}

class _NewItemState extends State<NewTransiction> {

  final _titleController = TextEditingController() ;
  final _amountController = TextEditingController() ;
  DateTime _selectedDate ;


  void _added() {

   if (_amountController.text.isEmpty) {
      return;
   }
    final entered_text = _titleController.text ;
    final entered_amount = double.parse(_amountController.text) ;

   if ( entered_text.isEmpty && entered_text == null || entered_amount <= 0 && _selectedDate == null ) {
      return;
    }

    widget.addNewItem(
               entered_text,
               entered_amount,
              _selectedDate,
              );

    Navigator.of(context).pop();

  }


void _recordDatePicker() {

    showDatePicker(context: context ,

             initialDate : DateTime.now(),
             firstDate: DateTime(2020)  ,
             lastDate: DateTime.now() ,

    ).then((pickedDate) {
      if (pickedDate == null ) {
          return ;
      }
      setState(() {
         _selectedDate = pickedDate;
      });

    });

  }

    @override
      Widget build(BuildContext context) {
            return
               Card(
                     elevation: 5,
                     child: Container (
                     padding: EdgeInsets.all(10),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                     TextField(decoration: InputDecoration(labelText: 'title') , style: TextStyle(
                       fontSize: 18,
                      fontWeight: FontWeight.bold,
                     ),
                               controller: _titleController,
                               onSubmitted: (_) => _added(),
                     ),

                     TextField(decoration: InputDecoration(labelText:'Amount') , style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                     ),
                               controller: _amountController ,
                               keyboardType: TextInputType.number,
                               onSubmitted: (_) => _added() ,
                     ),
                     
                    Container(
                    height: 70,
                    child:Row (children: <Widget>[
                      Text(_selectedDate == null ?  'Please enter A Date : ' : (' picked_date : ${DateFormat.yMd().format(_selectedDate)}') , style: TextStyle(color:Colors.black)),
                      FlatButton(child:Text('Choose date'),
                                 textColor: Theme.of(context).primaryColor,
                                 onPressed: _recordDatePicker),
                    ],),
                    ),

                    RaisedButton(child: Text('Submit', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.00),),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: _added,
                     ),
                    ])
                    ),
              );
          }
}

