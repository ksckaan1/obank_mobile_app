import 'package:flutter/material.dart';
import 'package:mybank/config/defaults.dart';
import 'package:mybank/data/transactions.dart';
import 'package:mybank/widgets/transaction_widget.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  var selectedTransactionList = "Today";
  var transactionType = ["Today", "Yesterday", "This week", "This month"];

  List<TransactionModel> activeList = transactionList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Transactions",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  DropdownButton<String>(
                      style: TextStyle(color: Colors.grey[300]),
                      icon: const Icon(Icons.date_range_rounded),
                      value: selectedTransactionList,
                      items: transactionType
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(color: textBlack),
                              )))
                          .toList(),
                      onChanged: (e) {
                        setState(() {
                          selectedTransactionList = e!;
                          if (e == "Today") {
                            activeList = transactionList;
                          } else if (e == "Yesterday") {
                            activeList = yesterdayTransactionList;
                          } else if (e == "This week") {
                            activeList = thisWeekTransactionList;
                          } else if (e == "This month") {
                            activeList = thisMonthTransactionList;
                          }
                        });
                      })
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(activeList.length, (i) {
                    return TransactionWidget(
                      icon: activeList[i].icon,
                      name: activeList[i].name,
                      date: activeList[i].date,
                      price: activeList[i].price,
                      isSending: activeList[i].isSending,
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
