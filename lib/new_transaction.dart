import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // String amountIntput='';
  // String titleInput='';
// buid in mechanisum provided by flutter instead of using on change
// these properties are the solution of the message that was showing in on changed because these are final but to show changes to ui we need to make statefull widget
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addtx;
  // we are using addtransaction wwhich is a private datamember of user_tansaction widget
  NewTransaction(this.addtx);
  // we are making a new method so that we need no to copy its code again and again we can simply call this function
  void submitData(){
    final enterdtitle=titleController.text;
    final enterdamount=double.parse(amountController.text);
    // if no input is recieved  simply go back we need valid input to go forward
    if(enterdtitle.isEmpty || enterdamount<=0){
      return;
    }
     addtx(enterdtitle,enterdamount);
  }
  @override
  Widget build(BuildContext context) {
    return        Card(
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
                        onSubmitted:(_)=> submitData(),
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
                            side:
                                const BorderSide(width: 4, color: Colors.blue)),
                        child: const Text('Add transactions'),
                      )
                      
                    ]),
              ));
  }
}