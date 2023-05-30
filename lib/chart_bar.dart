import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

 final String lable;
 final double spendingAmount;
 final double spendingPctofTotal;
 //constructor for chart bar 
 ChartBar({required this.lable,required this.spendingAmount,required this.spendingPctofTotal});

  @override
  Widget build(BuildContext context) {
    return 
    // these will be the ingridients of bars of everyday first we will have spending amount then a bar then alable for it
    Column(
      children: <Widget>[
        // fittedbox fix the size of the amount and fit it in given size
        // we have added a container to fix the height of the amount we are showing and the bar
        Container(
          height: 20,
          child: FittedBox
          (child: Text('₹${spendingAmount.toStringAsFixed(0)}')),
        ),
        SizedBox(height: 4,),
        Container(
          height: 60,
          width: 10,
          // we have used stack so that we we can show fractionally sized box over container and then we will change hight of fbox accordingly to show our percentage
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
                ),
              ),
              // special widget that will change its hight accordingly
              FractionallySizedBox(heightFactor:spendingPctofTotal,
              child: Container(decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),),)
            ],
          ) ,
        ),
        SizedBox(
          height: 4,
        ),
        Text(lable),
      ],
    );
  }
}