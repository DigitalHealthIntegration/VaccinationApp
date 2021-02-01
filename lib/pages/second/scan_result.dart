import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/qr_utils.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/model/coupon_model.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/card.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: PageTitles.ScanResult,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: AppCard(
                    elevation: 2,
                    borderRadius: 2.0,
                    padding: 0,
                    body: QrImage(
                      data: QrUtils.encodeQR(CouponModel(
                              age: "65",
                              city: "Bangalore",
                              conditions: "nsdiasn",
                              coupons: "500",
                              id: "123",
                              job: "Sfsa",
                              phase: "1A",
                              type: "coupon")
                          .toJson()),
                      version: QrVersions.auto,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "PATIENT LOCATION",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.medium),
                ),
                Text(
                  "Boston, MA",
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
                  "PHASE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.medium),
                ),
                Text(
                  "Essential Worker: Firefighter",
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
                  "Age",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.medium),
                ),
                Text(
                  "Under 65",
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
                  "COMBORDITY STATUS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.medium),
                ),
                Text(
                  "Yes",
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
                    height: 25,
                  ),
                  Text(
                    "Activate Coupon?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.light,
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.title),
                  ),
                  SizedBox(
                    height: 25,
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
                          onPressed: () {
                            RouteUtils.goToPage(
                                context, AppRoutes.AdministerReady);
                          },
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
