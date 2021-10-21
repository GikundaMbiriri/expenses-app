import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction.dart';
import '../widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recent;
  Chart(this.recent);
  List<Map<String, Object>> get groupedT {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recent.length; i++) {
        if (recent[i].date.day == weekDay.day &&
            recent[i].date.month == weekDay.month &&
            recent[i].date.year == weekDay.year) {
          totalSum += recent[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get maxS {
    return groupedT.fold(0.0, (previousValue, element) {
      return (previousValue as double) + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedT
                .map((data) => Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          data['day'],
                          data['amount'],
                          maxS == 0.0
                              ? 0.0
                              : (data['amount'] as double) / maxS),
                    ))
                .toList(),
          ),
        ));
  }
}
