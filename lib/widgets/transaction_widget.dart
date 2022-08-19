import 'package:flutter/material.dart';
import 'package:mybank/config/defaults.dart';

class TransactionWidget extends StatelessWidget {
  IconData icon;
  String name;
  String date;
  double price;
  bool isSending;
  TransactionWidget({
    Key? key,
    required this.icon,
    required this.name,
    required this.date,
    required this.price,
    required this.isSending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: isSending ? Colors.red[300] : Colors.green[400]),
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: textBlack),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )),
            Text(
              "${isSending ? '-' : '+'} \$$price",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isSending ? Colors.red[300] : Colors.green[400]),
            )
          ],
        ));
  }
}
