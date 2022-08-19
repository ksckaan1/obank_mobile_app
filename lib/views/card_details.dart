import 'package:flutter/material.dart';
import 'package:mybank/config/defaults.dart';
import 'package:mybank/widgets/credit_card.dart';

class CardDetailsScreen extends StatefulWidget {
  String personName = "";
  String cardNumber = "";
  String cardBG = "";
  String cardType = "";
  bool isDark = false;
  double balance = 0;

  CardDetailsScreen(
      {Key? key,
      required this.personName,
      required this.cardNumber,
      required this.cardBG,
      required this.cardType,
      required this.isDark,
      required this.balance})
      : super(key: key);

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  bool onlineshopping = false;
  bool domestic = true;
  bool overseas = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Hero(
              tag: widget.cardNumber,
              child: SizedBox(
                height: 230,
                child: CreditCard(
                  personName: widget.personName,
                  cardNumber: widget.cardNumber,
                  cardBG: widget.cardBG,
                  cardType: widget.cardType,
                  isDark: widget.isDark,
                  balance: widget.balance,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    "Balance",
                    style: TextStyle(color: textBlack),
                  ),
                  Text(
                    "\$${widget.balance.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: textBlack),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Permissions",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: textBlack),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Online Shopping",
                          style: TextStyle(color: textBlack),
                        ),
                        Switch(
                            value: onlineshopping,
                            onChanged: (res) {
                              setState(() {
                                onlineshopping = res;
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Domestic Shopping",
                          style: TextStyle(color: textBlack),
                        ),
                        Switch(
                            value: domestic,
                            onChanged: (res) {
                              setState(() {
                                domestic = res;
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Overseas Shopping",
                          style: TextStyle(color: textBlack),
                        ),
                        Switch(
                            value: overseas,
                            onChanged: (res) {
                              setState(() {
                                overseas = res;
                              });
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.key),
                        label: const Text("Change Password")),
                    ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        onPressed: () {},
                        icon: const Icon(Icons.report_problem_rounded),
                        label: const Text("Report Theft")),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
