import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mybank/views/home.dart';

class LoginProcess extends StatefulWidget {
  const LoginProcess({Key? key}) : super(key: key);

  @override
  State<LoginProcess> createState() => _LoginProcessState();
}

class _LoginProcessState extends State<LoginProcess> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2), () => Get.off(() => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "ppimage",
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.7),
                        blurRadius: 20,
                        offset: const Offset(0, 10))
                  ],
                  gradient: LinearGradient(
                      colors: [Colors.blue, Colors.blue.shade900],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/img/pp.jpg"),
                  radius: 50,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Lottie.asset("assets/lottie/loading.json", width: 150)
          ],
        ),
      ),
    );
  }
}
