import 'package:flutter/material.dart';
import './transactions.dart';
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
     List<Transactions>transactions = [Transactions(id: 1, title: "new shoes", amount: 2000, date: DateTime.now())];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter app"),
      ),
      // coloumn is a widget that takes as much width as much its children needs
      body: Column(
        // there are two type of allignment main axis and cross axis
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // for container we can fix it our self 
          Container(
            width: double.infinity,
              child: Card(
                  color: Colors.blue, child: Text("Chart!"), elevation: 5)),
          Card(
            color: Colors.red,
            child: Text("List of Tx"),
          )
        ],
      ),
    );
  }
}
