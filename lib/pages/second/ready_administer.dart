import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';

class ReadyAdminister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ready to\nadminister\nvaccine dose",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.light,
                fontWeight: FontWeight.w500,
                fontSize: FontSize.title),
          ),
          SizedBox(
            height: 60,
          ),
          Button(
            label: "Dose administered",
            onPressed: () {
              RouteUtils.goToPage(context, AppRoutes.BadgeProduction);
            },
            trailingIcon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
