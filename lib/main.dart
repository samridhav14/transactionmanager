import 'package:flutter/material.dart';
import './user_transaction.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Transaction Manager"),
      ),
      // coloumn is a widget that takes as much width as much its children needs
      // we need to add SingleChildScrollView to the whole column not a single file but what we can do is we can bind transaction list to a container and fix its height and then add scrolling their  
      body: SingleChildScrollView
      (  child: Column(
        // there are two type of allignment main axis and cross axis
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // for container we can fix it our self
            SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 8,
              child: Text("Chart!"),
            ),
          ),
        UserTransactions()
        ],
      ),)
    );
  }
}
