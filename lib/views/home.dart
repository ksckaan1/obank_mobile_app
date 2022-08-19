import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybank/views/camera_screen.dart';
import 'package:mybank/widgets/credit_card_list.dart';
import 'package:mybank/widgets/actions.dart';
import 'package:mybank/widgets/get_money.dart';
import 'package:mybank/widgets/header.dart';
import 'package:mybank/widgets/transaction_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPullDownActive = false;
  bool isPullUpActive = false;
  ScrollController sCont = ScrollController();
  double pullDownOpacity = 0;
  double pullUpOpacity = 0;
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();

    sCont.addListener(() async {
      if (sCont.offset < -70 && !isPullDownActive) {
        setState(() {
          isPullDownActive = true;
        });

        _cameras = await availableCameras();

        Get.to(() => CameraScreen(cameras: _cameras),
            transition: Transition.upToDown);
      } else if (sCont.offset < -35) {
        setState(() {
          pullDownOpacity = 1;
        });
      } else if (sCont.offset > 70 && !isPullUpActive) {
        setState(() {
          isPullUpActive = true;
        });

        Get.bottomSheet(const GetMoney());
      } else if (sCont.offset > 35) {
        setState(() {
          pullUpOpacity = 1;
        });
      } else {
        setState(() {
          isPullDownActive = false;
          pullDownOpacity = 0;
          isPullUpActive = false;
          pullUpOpacity = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 355,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                  child: AnimatedOpacity(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.qr_code,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Show QR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      opacity: pullUpOpacity,
                      duration: const Duration(milliseconds: 500)),
                  bottom: 10,
                ),
                Positioned(
                  child: AnimatedOpacity(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.qr_code,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Scan QR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      opacity: pullDownOpacity,
                      duration: const Duration(milliseconds: 500)),
                  top: 10,
                ),
                SingleChildScrollView(
                  controller: sCont,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: const [
                      HeaderWidget(),
                      CreditCardList(),
                      ActionButtons(),
                    ],
                  ),
                ),
              ]),
            ),
            const TransactionList()
          ],
        ),
      ),
    );
  }
}
