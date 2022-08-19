import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mybank/config/defaults.dart';
import 'package:mybank/config/input_formatters.dart';
import 'package:mybank/config/number_format.dart';
import 'package:mybank/data/saved_contacts.dart';
import 'package:mybank/views/transaction_screen.dart';
import 'package:mybank/widgets/credit_card_list.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  Contact? selectedContact;
  bool withIBAN = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Send Money",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: textBlack),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CreditCardList(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text("Enter Amount"),
                  ),
                  TextField(
                    inputFormatters: [amountFormatter],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: "\$???", border: InputBorder.none),
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: withIBAN
                        ? TextField(
                            inputFormatters: [ibanFormatter],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        withIBAN = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.grey.shade700,
                                    )),
                                border: const OutlineInputBorder(),
                                hintText: "Receiver IBAN Address",
                                prefixIcon: const Icon(
                                  Icons.money,
                                )),
                          )
                        : Container(
                            padding: const EdgeInsets.only(
                                top: 9, left: 6, right: 6),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                border:
                                    Border.all(color: Colors.grey.shade500)),
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<Contact>(
                                        value: selectedContact,
                                        hint: Row(
                                          children: [
                                            CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade400,
                                                child: const Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                                "Select a Saved Contact"),
                                          ],
                                        ),
                                        // icon: Icon(Icons.person),
                                        items: List.generate(contactList.length,
                                            (i) {
                                          return DropdownMenuItem(
                                              value: contactList[i],
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        "assets/pp/${contactList[i].imgUrl}"),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        contactList[i].name,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        contactList[i]
                                                            .bankNumber
                                                            .toIBANFormat(),
                                                        style: const TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ));
                                        }),
                                        onChanged: (item) {
                                          if (item != null) {
                                            setState(() {
                                              selectedContact = item;
                                            });
                                          }
                                        }),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        withIBAN = true;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.money,
                                      color: Colors.grey.shade700,
                                    ))
                              ],
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: "Enter Note",
                          prefixIcon: Icon(Icons.info)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                                const Size.fromHeight(50))),
                        onPressed: () {
                          Get.offAll(() => const TransactionScreen());
                        },
                        icon: const Icon(Icons.arrow_circle_right_rounded),
                        label: const Text("Send")),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
