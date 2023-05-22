import 'package:flutter/material.dart';
import './transactions.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  List<Transactions> transactions = [
    Transactions(id: 1, title: "New Shoes", amount: 2000, date: DateTime.now()),
    Transactions(id: 2, title: "Laptop", amount: 6000, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter app"),
      ),
      // coloumn is a widget that takes as much width as much its children needs
      body: Column(
        // there are two type of allignment main axis and cross axis
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // for container we can fix it our self
          Container(
              width: double.infinity,
              child: Card(
                  color: Colors.blue, child: Text("Chart!"), elevation: 8)),
                   Card(
                    elevation: 5,
                    // container is used to add padding which is not available in column
                    child: Container(
                      padding: EdgeInsets.all(10),
                      
                      child:   Column
                     (
                       crossAxisAlignment:CrossAxisAlignment.end,
                       children: 
                     <Widget>[
                      // here text feild is used to take user inputs  
                          TextField(decoration: InputDecoration(labelText: 'Title'),),
                          TextField(decoration: InputDecoration(labelText: 'Amount'),),
                          ElevatedButton(onPressed:()=> Null, child: Text('Add transactions'), style: ElevatedButton.styleFrom(
backgroundColor: Colors.purple,
side: BorderSide(width:4, color: Colors.blue)
),)
                   ]
                   ),)
                   ),
          Column(
            // here we cant maually make cards becuse this would be changed by user so we will map transactions here and then print the data
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                           // special syntax for adding $sign string interpolation no need to use to strin and adding to string
                       "₹${tx.amount}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.red)), 
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                         
                              tx.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                                fontSize: 15),
                          ),
                          Text(
                            // we have added an intel pakage to formate this date and included this to our main.dart file this is an external pakage and now it is our dependency in pubspec.yaml
                            // we can decide the pattetn also and also different inbuilt obj
                           DateFormat.yMMMEd().format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ])
                  ],
                ),
              );
            }).toList(),
            // here  to list helps to convert iterater to a list
          )
        ],
      ),
    );
  }
}
