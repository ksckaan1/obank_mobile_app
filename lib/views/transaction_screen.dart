import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybank/views/home.dart';
import 'package:lottie/lottie.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Lottie.asset("assets/lottie/money.json", repeat: false),
        ),
      ),
    );
  }
}
