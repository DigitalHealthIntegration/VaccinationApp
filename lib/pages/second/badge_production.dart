import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';

class BadgeProduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "How would the\npatient like to\nrecieve thier\n badges?",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.light,
                fontWeight: FontWeight.w500,
                fontSize: 30),
          ),
          SizedBox(
            height: 80,
          ),
          Button(
            label: "Print badge",
            onPressed: () {
              RouteUtils.goToPage(context, AppRoutes.BadgePrint);
            },
            trailingIcon: Icon(Icons.arrow_forward),
          ),
          SizedBox(
            height: 15,
          ),
          Button(
            label: "Email badge",
            onPressed: () {
              RouteUtils.goToPage(context, AppRoutes.BadgePrint);
            },
            trailingIcon: Icon(Icons.arrow_forward),
          ),
          SizedBox(
            height: 20,
          ),
          Button(
            label: "Send badge in a text",
            onPressed: () {
              RouteUtils.goToPage(context, AppRoutes.BadgePrint);
            },
            trailingIcon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
