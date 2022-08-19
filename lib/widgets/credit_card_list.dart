import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:mybank/controllers/card_controller.dart';
import 'package:mybank/data/credit_cards.dart';
import 'package:mybank/widgets/credit_card.dart';

class CreditCardList extends StatefulWidget {
  const CreditCardList({Key? key}) : super(key: key);

  @override
  State<CreditCardList> createState() => _CreditCardListState();
}

class _CreditCardListState extends State<CreditCardList> {
  int activePage = 0;
  CardController cardCont = Get.put(CardController());
  late PageController pCont;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pCont = PageController(initialPage: cardCont.selectedCard.value);
    return Column(
      children: [
        SizedBox(
          height: 230,
          child: PageView(
            controller: pCont,
            onPageChanged: (p) {
              cardCont.selectedCard.value = p;
              setState(() {
                activePage = p;
              });
            },
            children: List.generate(cardList.length, (i) {
              return Hero(
                tag: cardList[i].cardNumber,
                child: CreditCard(
                  personName: cardList[i].ownerName,
                  cardNumber: cardList[i].cardNumber,
                  cardBG: cardList[i].cardBG,
                  isDark: cardList[i].isDark,
                  cardType: cardList[i].cardType,
                  balance: cardList[i].balance,
                ),
              );
            }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(cardList.length, (i) {
            return Obx(() {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: cardCont.selectedCard.value == i
                      ? Colors.blue
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 10,
                height: 10,
              );
            });
          }),
        )
      ],
    );
  }
}
