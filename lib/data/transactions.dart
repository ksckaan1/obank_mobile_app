import 'package:flutter/material.dart';

class TransactionModel {
  String name;
  IconData icon;
  String date;
  double price;
  bool isSending;
  TransactionModel(this.name, this.icon, this.date, this.price, this.isSending);
}

List<TransactionModel> transactionList = [
  TransactionModel("Transaction Fee", Icons.credit_card, "8:35 PM", 2.44, true),
  TransactionModel("House Rent", Icons.house_rounded, "8:35 PM", 1200, true),
  TransactionModel("Adam Walker", Icons.person, "8:05 PM", 500, false),
  TransactionModel("Website Design", Icons.web, "6:32 PM", 1000, false),
  TransactionModel(
      "Best Employee", Icons.bedtime_sharp, "8:00 AM", 2000, false),
  TransactionModel("Playstation", Icons.work, "7:48 AM", 500, true),
  TransactionModel("Dues", Icons.build, "0:10 AM", 100, true),
  TransactionModel("Salary", Icons.work, "0:05 AM", 8500, false),
];

List<TransactionModel> yesterdayTransactionList = [
  TransactionModel("Transaction Fee", Icons.credit_card, "6:00 PM", 2.44, true),
  TransactionModel("Adam Walker", Icons.person, "7:35 PM", 500, true),
  TransactionModel("Website Design", Icons.web, "6:32 PM", 1000, false),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "1:06 AM", 300, false),
];

List<TransactionModel> thisWeekTransactionList = [
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 14, 6:00 PM", 15, true),
  TransactionModel("Market", Icons.shopping_cart, " July 12, 7:35 PM", 5, true),
  TransactionModel(
      "Website Design", Icons.web, "July 11, 6:32 PM", 1200, false),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 10, 9:00 AM", 1300, true),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 9, 9:00 AM", 20, true),
];

List<TransactionModel> thisMonthTransactionList = [
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 14, 6:00 PM", 15, true),
  TransactionModel("Market", Icons.shopping_cart, " July 12, 7:35 PM", 5, true),
  TransactionModel(
      "Website Design", Icons.web, "July 11, 6:32 PM", 1200, false),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 10, 9:00 AM", 1300, true),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 9, 9:00 AM", 20, true),
  TransactionModel("Website Design", Icons.web, "July 9, 6:32 PM", 4300, false),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 9, 9:00 AM", 700, true),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 8, 9:00 AM", 17, true),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 8, 8:00 AM", 5, true),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 7, 9:00 AM", 10, true),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 7, 9:00 AM", 110, true),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 6, 9:00 AM", 18, true),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 5, 9:00 AM", 17, true),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 4, 9:00 AM", 20, true),
  TransactionModel("Online Shopping (Amazon)", Icons.shopping_bag_outlined,
      "July 4, 9:00 AM", 25, true),
];
