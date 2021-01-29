import 'package:flutter/material.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/card.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VaccineRecognized extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: "VACCINE RECOGNIZED",
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 150,
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
                  height: 20,
                ),
                Text(
                  "MANUFACTURER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.medium),
                ),
                Text(
                  "PFfizer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.large),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "LOT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.medium),
                ),
                Text(
                  "X3D621",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.large),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "LOCATION",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.medium),
                ),
                Text(
                  "Parsnip Health, Boston",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.large),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration:
                  BoxDecoration(gradient: Gradients.confirmBottomGradient),
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "Confirm?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.light,
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.title),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Button(
                          label: "No",
                          style: TextStyle(
                              color: AppColors.light, fontSize: FontSize.large),
                          onPressed: () {},
                          color: AppColors.danger,
                          leadingIcon: Icon(
                            Icons.close,
                            size: 30,
                            color: AppColors.light,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Button(
                          label: "Yes",
                          style: TextStyle(
                              color: AppColors.light, fontSize: FontSize.large),
                          onPressed: () {},
                          color: AppColors.positive,
                          leadingIcon: Icon(
                            Icons.check,
                            size: 30,
                            color: AppColors.light,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
