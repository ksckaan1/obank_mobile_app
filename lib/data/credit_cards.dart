class CreditCardModel {
  String cardNumber;
  String ownerName;
  bool isDark;
  String cardBG;
  String cardType;
  double balance;

  CreditCardModel(this.cardNumber, this.ownerName, this.cardBG, this.isDark,
      this.cardType, this.balance);
}

List<CreditCardModel> cardList = [
  CreditCardModel("**** **** **** 1234", "Kaan Kuscu", "assets/img/cardbg1.jpg",
      true, "visa", 14765.50),
  CreditCardModel("**** **** **** 5678", "Kaan Kuscu",
      "assets/img/cardbg2.webp", true, "master", 3250.10),
  CreditCardModel("**** **** **** 3410", "Kaan Kuscu", "assets/img/cardbg3.jpg",
      true, "master", 1054250.00),
];
