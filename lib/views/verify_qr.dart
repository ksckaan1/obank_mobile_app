import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mybank/views/confirm_transaction.dart';

class VerifyQRScreen extends StatefulWidget {
  const VerifyQRScreen({Key? key}) : super(key: key);

  @override
  State<VerifyQRScreen> createState() => _VerifyQRScreenState();
}

class _VerifyQRScreenState extends State<VerifyQRScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4, milliseconds: 500),
        () => Get.off(() => const ConfirmTransactionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Lottie.asset("assets/lottie/verify_qr.json", repeat: false),
      ),
    );
  }
}
