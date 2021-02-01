import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/qr_utils.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/model/vaccine_model.dart';
import 'package:flutter_r1/store.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/card.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VaccineRecognized extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: PageTitles.VaccineRecognized,
      body: Stack(
        children: [
          Center(
            child: StoreConnector<AppStore, AppStore>(
              converter: (store) => store.state,
              builder: (context, store) => Column(
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
                        data: QrUtils.encodeQR(VaccineModel(
                                manufacturer: store.vaccine.manufacturer,
                                lotNo: store.vaccine.lotNo)
                            .toJson()),
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
                    store.vaccine.manufacturer,
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
                    store.vaccine.lotNo,
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
                    "${store.user.location.hospitalName}, ${store.user.location.city}",
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
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.Administrator,
                                ModalRoute.withName(AppRoutes.Location));
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
                            RouteUtils.setRootPage(context, AppRoutes.Home);
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
