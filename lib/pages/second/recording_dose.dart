import 'package:flutter/material.dart';
import 'package:flutter_r1/actions.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';

class RecordingDose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: PageTitles.RecordingDose,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Scan the patient eligibility\n coupon",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.w500,
                  fontSize: FontSize.title),
            ),
            SizedBox(
              height: 80,
            ),
            Button(
              label: "Ready to scan",
              onPressed: () {
                StoreUtils.dispatch(
                    context, ActionUpdateScanType(scanType: "coupon"));
                RouteUtils.goToPage(context, AppRoutes.CouponScan);
              },
              trailingIcon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
