import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/card.dart';
import 'package:flutter_r1/widgets/gradients.dart';

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
            GestureDetector(
              onTap: () {
                RouteUtils.goToPage(context, AppRoutes.Badge);
              },
              child: Stack(alignment: Alignment.center, children: [
                Image(
                  image: AssetImage("assets/qrbadge.png"),
                  height: 120,
                ),
                Image(
                  image: AssetImage("assets/topbadge.png"),
                  height: 30,
                ),
              ]),
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
            GestureDetector(
              onTap: () {
                RouteUtils.goToPage(context, AppRoutes.Status);
              },
              child: AppCard(
                padding: 5,
                borderRadius: 1,
                body: Stack(alignment: Alignment.center, children: [
                  Image(
                    image: AssetImage("assets/qrstatus.png"),
                    height: 100,
                  ),
                  Image(
                    image: AssetImage("assets/topstatus.png"),
                    height: 30,
                  ),
                ]),
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
                height: 110,
                width: 110,
                decoration: new BoxDecoration(
                  color: AppColors.light,
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: GestureDetector(
                  onTap: () {
                    RouteUtils.goToPage(context, AppRoutes.PassKey);
                  },
                  child: Stack(alignment: Alignment.center, children: [
                    Image(
                      image: AssetImage("assets/qrpasskey.png"),
                      height: 78,
                    ),
                    Image(
                      image: AssetImage("assets/toppasskey.png"),
                      height: 30,
                    ),
                  ]),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
