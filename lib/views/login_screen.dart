import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybank/config/defaults.dart';
import 'package:mybank/config/input_formatters.dart';
import 'package:mybank/views/login_process.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController pinFieldCont = TextEditingController();

  loginHandler() {
    Get.off(() => const LoginProcess());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
                child: Image.asset(
              "assets/img/login_bg.jpg",
              fit: BoxFit.cover,
            )),
            Positioned(
                top: 80,
                left: 50,
                right: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/img/banklogodark.png",
                      width: 100,
                    ),
                    const Icon(
                      Icons.notifications,
                      color: textBlack,
                      size: 30,
                    )
                  ],
                )),
            Center(
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60)),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextField(
                      onChanged: (value) {
                        if (value.length == 6) {
                          loginHandler();
                        }
                      },
                      inputFormatters: [pinFormatter],
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          filled: true,
                          hintText: "Enter PIN",
                          fillColor: Colors.white.withOpacity(.7)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: loginHandler,
                    child: const Text(
                      "Log In",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width - 100, 50))),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Customer Service",
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Nearest ATM",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
