import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final label;
  final sAmount;
  final sTotal;

  ChartBar(this.label, this.sAmount, this.sTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(children: [
        Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(child: Text('\$${sAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: constraints.maxHeight * 0.05,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              height: constraints.maxHeight * 0.6,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20)),
            ),
            FractionallySizedBox(
              heightFactor: sTotal,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ]),
        ),
        SizedBox(height: constraints.maxHeight * 0.05),
        Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(child: Text(label)))
      ]);
    });
  }
}
