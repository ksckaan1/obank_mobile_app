import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mybank/config/defaults.dart';
import 'package:mybank/views/login_screen.dart';
import 'package:mybank/views/profile_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Brightness get statusTheme => Brightness.dark;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      right: 10,
                      top: 70,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.offAll(() => const LoginScreen());
                        },
                        icon: const Icon(Icons.logout),
                        label: const Text("Log out"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                      )),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: const Text(
                        "Kaan Kuscu",
                        style: TextStyle(
                            color: textBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      width: Get.width,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    ),
                  ),
                  const Positioned(
                      bottom: 30,
                      child: Hero(
                          tag: "ppimage",
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("assets/img/pp.jpg"),
                          )))
                ],
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ProfileField(
                      icon: Icons.phone,
                      title: "Phone",
                      value: "+90 555 555 55 55"),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileField(
                      icon: Icons.mail,
                      title: "E-mail",
                      value: "me@kaanksc.com"),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileField(
                      icon: Icons.public,
                      title: "Website",
                      value: "kaanksc.com"),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileField(
                      icon: Icons.location_on,
                      title: "Location",
                      value: "Adelaide, Antarctica")
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
