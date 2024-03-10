import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rider/screens/QR/controller/controller.dart';
import 'package:rider/screens/QR/qr.dart';
import 'package:rider/utils/color.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController qrViewController;
  bool isFlashOn = false;

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 250.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: RColor.accent,
              borderRadius: 10,
              borderLength: 50,
              borderWidth: 15,
              cutOutSize: scanArea,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.flip_camera_ios),
                  onPressed: _switchCamera,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                IconButton(
                  icon: Icon(isFlashOn ? Icons.flash_off : Icons.flash_on),
                  onPressed: _toggleFlash,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      qrViewController = controller;
    });
    qrViewController.scannedDataStream.listen((scanData) {
      Get.find<QRCodeController>().setScannedData(scanData.code!);
      controller.dispose();
      Get.to(QRScreen());
    });
  }

  void _switchCamera() {
    qrViewController.flipCamera();
  }

  void _toggleFlash() {
    setState(() {
      isFlashOn = !isFlashOn;
    });
    qrViewController.toggleFlash();
  }

  @override
  void dispose() {
    qrViewController.dispose();
    super.dispose();
  }
}
