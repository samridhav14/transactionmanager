import 'package:flutter/material.dart';
import 'package:flutter_application_2/new_transaction.dart';
import './widgets/transactionslist.dart';
import './models/transactions.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transactions> UserTransactions = [
    Transactions(
        id: '1', title: "New Shoes", amount: 2000, date: DateTime.now()),
    Transactions(id: '2', title: "Laptop", amount: 6000, date: DateTime.now()),
  ];
  @override
  void _addnewTransaction(String txtitle, double txamount) {
    final newTx = Transactions(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());
        setState((){
          // we can not assign a new value to user transaction because it is a final entity what we can do is change the list
        UserTransactions.add(newTx);
}); 
  }
 
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(UserTransactions),
      ],
    );
  }
}



