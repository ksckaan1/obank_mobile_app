import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mybank/config/defaults.dart';

class GetMoney extends StatefulWidget {
  const GetMoney({Key? key}) : super(key: key);

  @override
  State<GetMoney> createState() => _GetMoneyState();
}

class _GetMoneyState extends State<GetMoney> {
  double qr_opacity = 0;
  double qr_anim_opacity = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        qr_anim_opacity = 0;
        qr_opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Get Money",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: textBlack),
          ),
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: qr_opacity,
                duration: const Duration(milliseconds: 500),
                child: Image.asset("assets/img/qr.png"),
              ),
              AnimatedOpacity(
                opacity: qr_anim_opacity,
                duration: const Duration(milliseconds: 500),
                child:
                    Lottie.asset("assets/lottie/create_qr.json", repeat: false),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
