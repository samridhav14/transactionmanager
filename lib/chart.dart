import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './widgets/transactionslist.dart';
import 'models/transactions.dart';


class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;
 // this  constructor will help us to get info of transaction of last seven days for our chart
  Chart(this.recentTransactions);
  // this would provide the data for lable
  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      // card will a row of lables and amount of some day there will be 7 bars for 7 days
      child: Row(
        children: groupedTransactionValues.map((data){
         //   return Text(data['Day']+':'+ data['amount'].toString())
        return Text()
        },).toList()
      ),
    );
  }
}

// class Transaction {
//   DateTime date;
//   double amount;

//   Transaction(this.date, this.amount);
// }
