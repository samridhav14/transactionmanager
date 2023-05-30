import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transaction;
  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      // we need to fix the height of container otherwise listview will not work fine
      height: 300,
      child: transaction.isEmpty
          ?
          // if no transactions are there we need to show some default messeage
          Column(
              children: [
                Text(
                  'No Transactions Added yet',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                //it will provide the space between text and image its a good alternative to container
                SizedBox(
                  height: 20,
                ),
                // we need to put image into a container and then we need to fix the size so that no overflow occur
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/default.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          // we have one more widget which we can use instead o f single child scrollable view it is listview is a widget that is column and by default singlechild scrolable
          // Listview is basically a widget with infinite height so we need to put in a container otherwise there will be a error
          // there are two type of list view one is direct and the other is by using builder constructor
          : ListView.builder(
              // standered syntax
              itemBuilder: (context, index) {
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: const EdgeInsets.symmetric(
                //           horizontal: 15,
                //           vertical: 10,
                //         ),
                //         decoration: BoxDecoration(
                //             border: Border.all(color: Colors.black, width: 2)),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //             // special syntax for adding $sign string interpolation no need to use to string and adding to string
                //             // it is used to fix decimal size to two digits
                //             "₹${transaction[index].amount.toStringAsFixed(2)}",
                //             style:  TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 18,
                //                 //here we have coloured it manually if we want to colur it by default theme
                //               //  color: Theme.of(context).primaryColorLight,
                //                 color: Colors.red
                //               )
                //               ),
                //       ),
                //       Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             Text(
                //               transaction[index].title,
                //               style: const TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.amber,
                //                   fontSize: 15),
                //             ),
                //             Text(
                //               // we have added an intel pakage to formate this date and included this to our main.dart file this is an external pakage and now it is our dependency in pubspec.yaml
                //               // we can decide the pattetn also and also different inbuilt obj
                //               DateFormat.yMMMEd().format(transaction[index].date),
                //               style: const TextStyle(color: Colors.grey),
                //             ),
                //           ])
                //     ],
                //   ),
                // );;
                return Card(
                   elevation:5,
                  margin: EdgeInsets.symmetric(
                    vertical:8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                          child: FittedBox(
                              child: Text('₹${transaction[index].amount}'))),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: TextStyle( fontFamily: 'OpenSans',
                     fontWeight: FontWeight.bold,
                    fontSize: 18, ),
                    ),
                    subtitle: Text(DateFormat.yMMMMd().format(transaction[index].date) ),
                  ),
                );
              },
              itemCount: transaction.length,
              // here we cant maually make cards becuse this would be changed by user so we will map transactions here and then print the data
              // this mapping technique wont work any more becuse builder take a number of item and repeats the builder function for every item
              // children: transaction.map((tx) {
              //   return
              // }).toList(),
              // here  to list helps to convert iterater to a list
            ),
    );
  }
}
