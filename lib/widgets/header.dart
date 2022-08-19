import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:mybank/config/defaults.dart';
import 'package:mybank/views/profile_screen.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/img/banklogodark.png",
            width: 100,
          ),
          GestureDetector(
              onTap: () => Get.to(() => const ProfileScreen()),
              child: Row(
                children: const [
                  Text(
                    "Kaan",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: textBlack),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Hero(
                    tag: "ppimage",
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/img/pp.jpg"),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
