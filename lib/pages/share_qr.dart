import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/card.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShareQr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: PageTitles.ShareQr,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              child: AppCard(
                elevation: 2,
                borderRadius: 2.0,
                padding: 0,
                body: QrImage(
                  data: "www.google.com",
                  version: QrVersions.auto,
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Button(
              label: "Share QR",
              onPressed: () {
                RouteUtils.goToPage(context, AppRoutes.CouponScan);
              },
              trailingIcon: Icon(Icons.share),
            ),
          ],
        ),
      ),
    );
  }
}
