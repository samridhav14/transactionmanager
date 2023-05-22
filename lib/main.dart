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
  // String amountIntput='';
  // String titleInput='';
// buid in mechanisum provided by flutter instead of using on change
// these properties are the solution of the message that was showing in on changed because these are final but to show changes to ui we need to make statefull widget
final titleController =TextEditingController();
final amountController =TextEditingController();





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
        const  SizedBox(
              width:  double.infinity,
              child: Card(
                  color: Colors.blue,  elevation: 8,child: Text("Chart!"),),),
          Card(
              elevation: 5,
              // container is used to add padding which is not available in column
              child: Container(
                padding:const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      // here text feild is used to take user inputs
                     TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        // here onchanged is one of the rare case in which we can change something in stateless widget althoug we cant change ui to show it without using statefull widget
                                    // onChanged: (value) => titleInput=value,
                                       controller: titleController,
                      ),
                       TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        // onChanged: (value) {
                        //     amountIntput=value;
                        // }
                        controller: amountController ,
                      ),
                      ElevatedButton(
                        onPressed: (){
                          // to check that on changed work or not 
                         // print(amountIntput);
                         // print(titleInput);
                         print(titleController.text);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            side:const  BorderSide(width: 4, color: Colors.blue)),
                             child: const Text('Add transactions'),
                      )
                    ]),
              )),
          Column(
            // here we cant maually make cards becuse this would be changed by user so we will map transactions here and then print the data
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:const  EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                          // special syntax for adding $sign string interpolation no need to use to strin and adding to string
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
          )
        ],
      ),
    );
  }
}
