import 'package:flutter/material.dart';
import './chart_bar.dart';
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
        'day': DateFormat.E().format(weekDay).substring(0,1),
        'amount': totalSum,
      };
    });
  }
// geteer for percentage of spending
double get totalSpending{
  // fold helps to convert list to another logic
  // initially sum will contain zero and add item[amount] every time
  return groupedTransactionValues.fold(0.0,(sum,item){
       return sum +item['amount'];
  });
}
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      // card will a row of lables and amount of some day there will be 7 bars for 7 days
      // we have added a container to fix padding of chart if our only goal is to do padding we can directly use padding widget
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          // this will spread all the bars accross the area
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data){
           //   return Text(data['Day']+':'+ data['amount'].toString())
           // string interpolation
          //return Text("${data['Day']}: ${data['amount']}");
          return Flexible(
            // by this we are forcing to take default space for every bar we can use flex for selecting it individually by tight we are also insuring that every child cant change their size with time
            fit: FlexFit.tight,
            child: ChartBar(lable:data['day'],
            spendingAmount: data['amount'],
            spendingPctofTotal: totalSpending==0.0 ? 0.00 :(data['amount'] as double)/totalSpending,)
            );
          },).toList()
        ),
      ),
    );
  }
}

// class Transaction {
//   DateTime date;
//   double amount;

//   Transaction(this.date, this.amount);
// }
