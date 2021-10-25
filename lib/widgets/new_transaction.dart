import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController;
  final amountController;
  final datePicker;
  NewTransaction(
      this.addTx, this.titleController, this.amountController, this.datePicker);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  onChanged: (text) {
                    print('First text field: ${titleController.text}');
                  },
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    print('First text field: $text');
                  },
                  controller: amountController,
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Text('No date chosen'),
                      FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          onPressed: () => {},
                          child: Text(
                            'Choose a date!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                RaisedButton(
                    onPressed: () => {
                          if (titleController.text.isEmpty ||
                              amountController.text.isEmpty)
                            {print('dkk')}
                          else
                            {
                              addTx(titleController.text,
                                  double.parse(amountController.text))
                            }
                        },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text('Add Transaction'))
              ],
            )),
      ),
    );
  }
}
