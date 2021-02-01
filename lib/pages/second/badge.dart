import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:flutter_r1/widgets/textinput.dart';

class Badge extends StatelessWidget {
  String pat_name, pat_date, pat_manuf, pat_product, pat_lot, pat_route, pat_site, pat_dosage, pat_doses, pat_next_dose, pat_vaccinator, pat_pass_key;
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: PageTitles.Badge,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Date",
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
                  onChange: (str) {
                    pat_name = str;
                  },
                  placeholder: "Date",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Manuf",
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
                  onChange: (str) {
                    pat_name = str;
                  },
                  placeholder: "Manuf",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Product",
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
                  onChange: (str) {
                    pat_name = str;
                  },
                  placeholder: "Product",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Lot#",
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
                  onChange: (str) {
                    pat_name = str;
                  },
                  placeholder: "Lot#",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Route",
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
                  onChange: (str) {
                    pat_name = str;
                  },
                  placeholder: "Route",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Site",
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
                  onChange: (str) {
                    pat_name = str;
                  },
                  placeholder: "Site",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Dosage",
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
                  onChange: (str) {
                    pat_name = str;
                  },
                  placeholder: "Dosage",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Doses",
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
                  onChange: (str) {
                    pat_name = str;
                  },
                  placeholder: "Doses",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Next Doses",
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
                  onChange: (str) {
                    pat_name = str;
                  },
                  placeholder: "Next Doses",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Vaccinator",
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
                  onChange: (str) {
                    pat_name = str;
                  },
                  placeholder: "Vaccinator",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Passkey",
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
                  onChange: (str) {
                    pat_name = str;
                  },
                  placeholder: "Passkey",
                ),
                SizedBox(
                  height: 10,
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
        ),
      ),
    );
  }
}