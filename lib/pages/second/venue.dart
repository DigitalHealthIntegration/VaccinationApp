import 'package:flutter/material.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';

class Venue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: "",
      disableBack: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "ADMINISTRATOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.w400,
                  fontSize: FontSize.medium),
            ),
            Text(
              "Norman Gale",
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
              "Local 308\nElectricians Union",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.w500,
                  fontSize: FontSize.large),
            ),
            SizedBox(
              height: 100,
            ),
            Button(
              label: "Verify Status",
              onPressed: () {},
              trailingIcon: Icon(Icons.arrow_forward),
            ),
            SizedBox(
              height: 40,
            ),
            Button(
              label: "Acitvate Eligibility Coupon",
              onPressed: () {},
              trailingIcon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
