import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mybank/config/defaults.dart';
import 'package:mybank/views/transaction_screen.dart';
import 'package:mybank/widgets/credit_card_list.dart';

class ConfirmTransactionScreen extends StatelessWidget {
  const ConfirmTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: const [
                      Text(
                        "Confirm Payment",
                        style: TextStyle(
                            color: textBlack,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Select a payment method",
                        style: TextStyle(color: textBlack, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const CreditCardList(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Column(
                          children: const [
                            Text(
                              "Agreement",
                              style: TextStyle(color: textBlack, fontSize: 20),
                            ),
                            Text(
                              "\$600",
                              style: TextStyle(
                                  color: textBlack,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(() => const TransactionScreen());
                          },
                          child: const Text("Approve")),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey)),
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Cancel")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
