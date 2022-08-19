import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybank/views/send_money.dart';
import 'package:mybank/widgets/get_money.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const SendMoneyScreen());
              },
              child: const Text("Send Money"),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.bottomSheet(const GetMoney());
              },
              child: const Icon(Icons.get_app))
        ],
      ),
    );
  }
}
