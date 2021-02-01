import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:flutter_r1/widgets/textinput.dart';

class Passkey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: PageTitles.PassKey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.w300,
                  fontSize: FontSize.medium),
            ),
            SizedBox(
              height: 10,
            ),
            TextInput(
              onChange: (str) {},
              placeholder: "Patient Name",
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Phone",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.w300,
                  fontSize: FontSize.medium),
            ),
            SizedBox(
              height: 10,
            ),
            TextInput(
              onChange: (str) {},
              placeholder: "Phone",
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "DoB",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.w300,
                  fontSize: FontSize.medium),
            ),
            SizedBox(
              height: 10,
            ),
            TextInput(
              onChange: (str) {},
              placeholder: "DoB",
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Salt",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.w300,
                  fontSize: FontSize.medium),
            ),
            SizedBox(
              height: 10,
            ),
            TextInput(
              onChange: (str) {},
              placeholder: "Salt",
            ),
            SizedBox(
              height: 50,
            ),
            Button(
              onPressed: () {
                RouteUtils.goToPage(context, AppRoutes.ShareQr);
              },
              label: "Generate QR",
            )
          ],
        ),
      ),
    );
  }
}
