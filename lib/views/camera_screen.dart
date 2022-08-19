import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mybank/config/defaults.dart';
import 'package:mybank/views/confirm_transaction.dart';
import 'package:mybank/views/transaction_screen.dart';
import 'package:mybank/views/verify_qr.dart';

class CameraScreen extends StatefulWidget {
  List<CameraDescription> cameras;

  CameraScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  bool isCamsLoaded = false;

  @override
  void initState() {
    super.initState();
    if (widget.cameras.isNotEmpty) {
      controller = CameraController(widget.cameras[0], ResolutionPreset.max);
      setState(() {
        isCamsLoaded = true;
      });
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              print('User denied camera access.');
              break;
            default:
              print('Handle other errors.');
              break;
          }
        }
      });
    }
  }

  @override
  void dispose() {
    if (isCamsLoaded) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isCamsLoaded) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.photo_camera,
                color: Colors.white,
                size: 30,
              ),
              const Text(
                "Unable to access camera",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const VerifyQRScreen());
                  },
                  child: const Text("Simulate QR Process"))
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: CameraPreview(
            controller,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Positioned(
                    bottom: 20,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const VerifyQRScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Icon(
                          Icons.qr_code,
                          color: textBlack,
                          size: 50,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    }
  }
}
