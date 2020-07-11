   return Card(
                    child: Row(
                      children: <Widget>[
                      Container(
                        margin : EdgeInsets.symmetric(vertical:10, horizontal:11),
                        decoration : BoxDecoration(border:
                                   Border.all(color: Theme.of(context).primaryColor , width: 2 ),
                                   ),
                        padding: EdgeInsets.all(15), // padding take 10 in all directions!
                        child: Text( 'Price : ${transiction[index].amount.toStringAsFixed(2)}\$' , style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        ),),
                      ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Text(transiction[index].name,
                             style: TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                            ),),

                        Text(DateFormat('dd/MM/yyyy').format(transiction[index].date),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ) ,
                              ),
                        ],),
                      ],),
                );