import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController;
  final amountController;
  NewTransaction(this.addTx, this.titleController, this.amountController);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(10),
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
              FlatButton(
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
                  textColor: Colors.purple,
                  child: Text('Add Transaction'))
            ],
          )),
    );
  }
}
