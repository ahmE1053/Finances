import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:finance/Transactions.dart';

class Charts extends StatelessWidget {
  List<double> totalsumlist = [0];
  double totalsum = 0;
  final List<Transactions> recents;
  Charts({
    Key? key,
    required this.recents,
  }) {
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < recents.length; j++) {
        if (recents[j].date.day ==
                DateTime.now().subtract(Duration(days: i)).day &&
            recents[j].date.month ==
                DateTime.now().subtract(Duration(days: i)).month &&
            recents[j].date.year ==
                DateTime.now().subtract(Duration(days: i)).year) {
          totalsumlist[i] += recents[j].price;
        }
      }
      totalsum += totalsumlist[i];
      totalsumlist.add(0);
    }
    print(totalsum);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          for (int i = 0; i < 7; i++)
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: constraints.maxHeight * 0.10,
                    child: FittedBox(
                      child: Text(
                        DateFormat('E')
                            .format(
                              DateTime.now().subtract(
                                Duration(days: i),
                              ),
                            )
                            .toString(),
                      ),
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    width: constraints.maxWidth * 0.05,
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 7, bottom: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        FractionallySizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // margin: EdgeInsets.all(20),
                          ),
                          heightFactor:
                              totalsum != 0 ? totalsumlist[i] / totalsum : 0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.10,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        totalsumlist[i].toString(),
                        // style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ],
      );
    });
  }
}
