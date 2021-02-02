import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/card.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:flutter_r1/store.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class ShareQr extends StatelessWidget {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final dynamic qrType = ModalRoute.of(context).settings.arguments;
    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: PageTitles.ShareQr,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StoreConnector<AppStore, String>(
          converter: (store) => store.state.shareQrString,
          builder: (context, shareQrString) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Screenshot(
                controller: screenshotController,
                child: Container(
                  height: 250,
                  width: 250,
                  child: AppCard(
                    elevation: 2,
                    borderRadius: 2.0,
                    padding: 0,
                    body: QrImage(
                      data: shareQrString,
                      version: QrVersions.auto,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Button(
                label: "Share QR",
                onPressed: () async {
                  try {
                    File qrImage = await screenshotController.capture(
                      delay: Duration(milliseconds: 10),
                      pixelRatio: 20.0
                    );
                    await Share.shareFiles([qrImage.path],
                        text: "VaccinationApp: $qrType");
                  } catch (e) {
                    print(e);
                    return;
                  }
                },
                trailingIcon: Icon(Icons.share),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
