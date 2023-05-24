import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/transactions.dart';
import 'package:intl/intl.dart';  

class TransactionList extends StatelessWidget {
    final List<Transactions>transaction;
    TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return    
          Column(
            // here we cant maually make cards becuse this would be changed by user so we will map transactions here and then print the data
            children: transaction.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                          // special syntax for adding $sign string interpolation no need to use to string and adding to string
                          "₹${tx.amount}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.red)),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                                fontSize: 15),
                          ),
                          Text(
                            // we have added an intel pakage to formate this date and included this to our main.dart file this is an external pakage and now it is our dependency in pubspec.yaml
                            // we can decide the pattetn also and also different inbuilt obj
                            DateFormat.yMMMEd().format(tx.date),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ])
                  ],
                ),
              );
            }).toList(),
            // here  to list helps to convert iterater to a list
          );
  }
}