import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // String amountIntput='';
  // String titleInput='';
// buid in mechanisum provided by flutter instead of using on change
// these properties are the solution of the message that was showing in on changed because these are final but to show changes to ui we need to make statefull widget
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // to check that on changed work or not
                          // print(amountIntput);
                          // print(titleInput);
                          print(titleController.text);
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