import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/card.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PrintBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: PageTitles.BadgesPrinting,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "BADGE",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.w400,
                  fontSize: FontSize.medium),
            ),
            Transform.rotate(
              angle: 40,
              child: GestureDetector(
                onTap: () {
                  RouteUtils.goToPage(context, AppRoutes.PassKey);
                },
                child: Container(
                  height: 100,
                  width: 100,
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
              ),
            ),
            SizedBox(height: 30),
            Text(
              "STATUS",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.w400,
                  fontSize: FontSize.medium),
            ),
            Container(
              height: 100,
              width: 100,
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
            SizedBox(height: 30),
            Text(
              "PASSKEY",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.w400,
                  fontSize: FontSize.medium),
            ),
            Stack(children: [
              Container(
                height: 100,
                width: 100,
                decoration: new BoxDecoration(
                  color: AppColors.light,
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Container(
                  height: 80,
                  width: 80,
                  child: QrImage(
                    data: "www.google.com",
                    version: QrVersions.auto,
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
