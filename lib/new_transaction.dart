import 'package:flutter/material.dart';

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
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  // we are making a new method so that we need no to copy its code again and again we can simply call this function
  void submitData() {
    final enterdtitle = titleController.text;
    final enterdamount = double.parse(amountController.text);
    // if no input is recieved  simply go back we need valid input to go forward.
    if (enterdtitle.isEmpty || enterdamount <= 0) {
      return;
    }
    widget.addtx(
      enterdtitle,
      enterdamount,
    );
    //this closes the the sheet as we hit add transaction to it context is a special property vailable in state class
    Navigator.of(context).pop();
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
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  // onChanged: (value) {
                  //     amountIntput=value;
                  // }
                  controller: amountController,
                  // use to fix the keyboard as number for amount
                  keyboardType: TextInputType.number,
                  // it is basically a way of writing whatever input comes we dont have any use of it
                  onSubmitted: (_) => submitData(),
                ),
                Container(
                  height: 70,
                  child: Row(children: <Widget>[
                            Text('No Date Choosen!'),
                          TextButton(onPressed: ()=>null, child: Text('Choose Date',style: TextStyle(color: Color.alphaBlend(Colors.purple,Colors.blue),fontWeight: FontWeight.bold)), )
                  ],),
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
