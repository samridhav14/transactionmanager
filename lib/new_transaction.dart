import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// we need to make this statefull otherwise as we will enter the data our data will be lost internal implementation of flutter is such stat if parent widget gets rebuilt the isuue srrises at other places
class NewTransaction extends StatefulWidget {
  final Function addtx;
  // we are using addtransaction wwhich is a private datamember of user_tansaction widget
  NewTransaction(this.addtx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // String amountIntput='';
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

   DateTime? _selectdate;

  // we are making a new method so that we need no to copy its code again and again we can simply call this function
  void submitData() {
    if(_amountController.text.isEmpty) return;
    final enterdtitle = _titleController.text;
    final enterdamount = double.parse(_amountController.text);
    // if no input is recieved  simply go back we need valid input to go forward.
    if (enterdtitle.isEmpty || enterdamount <= 0 || _selectdate==null) {
      return;
    }
    widget.addtx(
      enterdtitle,
      enterdamount,
      _selectdate,
    );
    //this closes the the sheet as we hit add transaction to it context is a special property vailable in state class
    Navigator.of(context).pop();
  }

  // to open the date picker which is a inbuilt widget
  void _presentdatepicker() {
    // show Date picker returns us the future widget which basically means that when the user will pick some date then it will return
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime.now(),
        ).then((pickedDate) {
              if(pickedDate==null){
                return;
              }
              setState(() {
                 _selectdate=pickedDate;
              });   
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        // container is used to add padding which is not available in column
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // here text feild is used to take user inputs
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  // here onchanged is one of the rare case in which we can change something in stateless widget althoug we cant change ui to show it without using statefull widget
                  // onChanged: (value) => titleInput=value,
                  controller: _titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  // onChanged: (value) {
                  //     amountIntput=value;
                  // }
                  controller: _amountController,
                  // use to fix the keyboard as number for amount
                  keyboardType: TextInputType.number,
                  // it is basically a way of writing whatever input comes we dont have any use of it
                  onSubmitted: (_) => submitData(),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      // expanded is used so that text can take whole area 
                  Expanded  (child: Text(_selectdate==null ? 'No Date Choosen!' :DateFormat.yMMMd().format(_selectdate!).toString()),),
                      TextButton(
                        onPressed: () => _presentdatepicker(),
                        child: Text('Choose Date',
                            style: TextStyle(
                                color: Color.alphaBlend(
                                    Colors.purple, Colors.blue),
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // to check that on changed work or not
                    // print(amountIntput);
                    // print(titleInput);
                    submitData();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      side: const BorderSide(width: 4, color: Colors.blue)),
                  child: const Text('Add transactions'),
                )
              ]),
        ));
  }
}
