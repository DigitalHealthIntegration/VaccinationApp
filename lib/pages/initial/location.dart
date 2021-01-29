import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';

class Location extends StatelessWidget {
  String locationValue = "One";
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome back\nCedar Knolls!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.light,
                fontWeight: FontWeight.w500,
                fontSize: FontSize.title),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Please confirm your location for today",
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
          Container(
            padding: EdgeInsets.all(8.0),
            color: AppColors.textInputFill,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: locationValue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                onChanged: (String newValue) {
                  locationValue = newValue;
                },
                isExpanded: true,
                items: <String>["One", "Two"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Button(
            label: "Scan Vaccine Batch",
            onPressed: () {
              RouteUtils.goToPage(context, AppRoutes.Administrator);
            },
            trailingIcon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
