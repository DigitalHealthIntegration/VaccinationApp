import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQr extends StatefulWidget {
  @override
  _ScanQrState createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController qrViewController;

  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      padding: EdgeInsets.all(0),
      body: Stack(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    overlayColor: Color.fromRGBO(0, 0, 0, 30),
                    borderRadius: 0,
                    borderLength: 150,
                    borderWidth: 5,
                    borderColor: AppColors.positive),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(gradient: Gradients.qrBottomGradient),
                padding: EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        RouteUtils.goToPage(
                            context, AppRoutes.VaccineRecognized);
                      },
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          color: AppColors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Stack(children: [
                          IconButton(
                            icon: Icon(
                              Icons.flash_on,
                              size: 25,
                              color: AppColors.textInputFill,
                            ),
                            onPressed: () {},
                          ),
                          Icon(
                            Icons.radio_button_unchecked,
                            size: 50,
                            color: AppColors.textInputFill,
                          )
                        ]),
                      ),
                    ),
                    Button(
                      label: "  AUTO CAPTURE: ON  ",
                      onPressed: () {
                        RouteUtils.goToPage(context, AppRoutes.ScanResult);
                      },
                      padding: EdgeInsets.all(4.0),
                      style: TextStyle(
                          fontSize: FontSize.small,
                          fontWeight: FontWeight.bold),
                      borderRadius: 2,
                      color: AppColors.yellow,
                      elevation: 1,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        RouteUtils.goBack(context);
                      },
                    ),
                  ],
                ),
                Icon(
                  Icons.check_circle_rounded,
                  size: 50,
                  color: AppColors.positive,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ACCEPTED!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.medium),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      print(scanData.code);
    });
  }
}
