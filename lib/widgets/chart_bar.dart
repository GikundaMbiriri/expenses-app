import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final label;
  final sAmount;
  final sTotal;

  ChartBar(this.label, this.sAmount, this.sTotal);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FittedBox(child: Text('\$${sAmount.toStringAsFixed(0)}')),
      SizedBox(
        height: 4,
      ),
      Container(
        height: 60,
        width: 10,
        child: Stack(children: [
          Container(
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
      SizedBox(height: 4),
      Text(label)
    ]);
  }
}
