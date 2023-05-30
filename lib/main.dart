import 'package:flutter/material.dart';
import './new_transaction.dart';
import './widgets/transactionslist.dart';
import './models/transactions.dart';
import './chart.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction Manager',
      // theme helps us to set a global theme for our application a combination of colour and text style etc
      theme: ThemeData(
          // primary based on a primary colour but it adjust shades according to diff widgets all the default colurs will be purple
          primarySwatch: Colors.green,
          // to set a theme colour that we have in our fonts folder
          fontFamily: 'Quicksand',
          //  textTheme: ThemeData.light().textTheme.copyWith(
          //       titleLarge: TextStyle(
          //         fontFamily: 'OpenSans',
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18,
          //       ),
          //     ),
          // button: TextStyle(color:colors.white),
          // app baar default theme
          appBarTheme: AppBarTheme(
            titleTextStyle:TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> _UserTransactions = [
    Transactions(
        id: '1', title: "New Shoes", amount: 2000, date: DateTime.now()
        ),
    Transactions(
      id: '2', title: "Laptop", amount: 6000, date: DateTime.now()
      ),
  ];
  // list used get data of recent 7 transactions
  List<Transactions> get _recentTransactions{
    return  _UserTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addnewTransaction(String txtitle, double txamount) {
    final newTx = Transactions(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());
    setState(() {
      // we can not assign a new value to user transaction because it is a final entity what we can do is change the list
      _UserTransactions.add(newTx);
    });
  }

  // it start the process to add new transaction
  void _startAddnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        // since we need to build this thing again and again as we press add button we need to make this a statefull widget
        return GestureDetector(
          // this on tap will help us that when we tap on the sheet it should not get closed
          onTap: () {},
          child: NewTransaction(_addnewTransaction),
          // this behaviour will help us if we tap outside the sheet it will close
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transaction Manager",
        //  style: TextStyle(fontFamily: 'Open Sans'
        ),
        // here we are adding a button on the app baar to add new transactions
        actions: <Widget>[
          IconButton(
              onPressed: () => _startAddnewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      // coloumn is a widget that takes as much width as much its children needs
      // we need to add SingleChildScrollView to the whole column not a single file but what we can do is we can bind transaction list to a container and fix its height and then add scrolling their
      // we have one more widget which we can use instead o f single child scrollable view it is listview is a widget that is column and by default singlechild scrolable
      //SingleChildScrollView
      body: SingleChildScrollView(
        child: Column(
          // there are two type of allignment main axis and cross axis
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // for container we can fix it our self
            // const SizedBox(
            //   width: double.infinity,
            //   child: Card(
            //     color: Colors.blue,
            //     elevation: 8,
            //     child: Text("Chart!"),
            //   ),
            // ),
            // this will be helping to make chart of our recent transaction
            Chart(_UserTransactions),
            // UserTransactions()
            TransactionList(_UserTransactions),
          ],
        ),
      ),
      // this will add a floating button to add new transactions
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddnewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
