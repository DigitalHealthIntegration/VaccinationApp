import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/qr_utils.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/model/coupon_model.dart';
import 'package:flutter_r1/store.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/card.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
            child: StoreConnector<AppStore, CouponModel>(
              converter: (store) => store.state.coupon,
              builder: (context, coupon) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 105,
                    width: 105,
                    child: AppCard(
                      elevation: 2,
                      borderRadius: 2.0,
                      padding: 0,
                      body: QrImage(
                        data: "sahudbadniancuiasncnanc",
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
                    coupon.city,
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
                    coupon.phase,
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
                    coupon.age,
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
                    coupon.conditions != null ? "Yes" : "No",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.light,
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.large),
                  ),
                ],
              ),
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
                    "Activate \nCoupon?",
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
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.RecordingDose,
                                ModalRoute.withName(AppRoutes.Home));
                          },
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
