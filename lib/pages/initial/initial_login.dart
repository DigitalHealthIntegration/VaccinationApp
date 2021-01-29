import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';

class InitialLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/logo.png"),
            height: 150.0,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Hello!",
            style: TextStyle(
                color: AppColors.light,
                fontWeight: FontWeight.w500,
                fontSize: FontSize.title),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Login to begin the day",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.light,
              fontSize: FontSize.large,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Button(
            label: "LOGIN WITH GOOGLE",
            leadingImage: Image(
              image: AssetImage("assets/google_logo.png"),
              height: 20,
            ),
            onPressed: () {
              RouteUtils.goToPage(context, AppRoutes.Location);
            },
          ),
        ],
      ),
    );
  }
}
