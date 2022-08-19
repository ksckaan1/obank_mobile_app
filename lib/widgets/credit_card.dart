import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:mybank/views/card_details.dart';

class CreditCard extends StatelessWidget {
  String personName;
  String cardNumber;
  bool? isDark;
  final String cardBG;
  String cardType;
  double balance;

  CreditCard(
      {Key? key,
      required this.personName,
      required this.cardNumber,
      required this.cardBG,
      required this.cardType,
      this.isDark = false,
      required this.balance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: GestureDetector(
        onTap: () {
          Get.to(() => CardDetailsScreen(
                cardBG: cardBG,
                cardNumber: cardNumber,
                personName: personName,
                isDark: isDark!,
                cardType: cardType,
                balance: balance,
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 5), blurRadius: 10)
            ],
            image:
                DecorationImage(image: AssetImage(cardBG), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellow[800],
          ),
          child: Stack(
            children: [
              Positioned(
                child: DefaultTextStyle(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: isDark! ? Colors.white : Colors.black),
                    child: Text(
                      personName,
                    )),
                bottom: 20,
                left: 20,
              ),
              Positioned(
                  left: 20,
                  bottom: 50,
                  child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark! ? Colors.white : Colors.black),
                    child: Text(
                      cardNumber,
                    ),
                  )),
              Positioned(
                child: Image.asset(
                  "assets/img/chip.png",
                  filterQuality: FilterQuality.high,
                  width: 40,
                  height: 40,
                ),
                bottom: 20,
                right: 20,
              ),
              Positioned(
                child: Image.asset(
                  isDark!
                      ? "assets/img/banklogolight.png"
                      : "assets/img/banklogodark.png",
                  filterQuality: FilterQuality.high,
                  width: 80,
                ),
                top: 20,
                left: 20,
              ),
              Positioned(
                child: Image.asset(
                  cardType == "master"
                      ? "assets/img/mastercard.png"
                      : "assets/img/visacard.png",
                  filterQuality: FilterQuality.high,
                  width: 60,
                ),
                top: 20,
                right: 20,
              )
            ],
          ),
          height: 10,
        ),
      ),
    );
  }
}
