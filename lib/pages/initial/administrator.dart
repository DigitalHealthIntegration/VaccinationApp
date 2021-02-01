import 'package:flutter/material.dart';
import 'package:flutter_r1/actions.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/model/user_model.dart';
import 'package:flutter_r1/store.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Administrator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: "",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: StoreConnector<AppStore, UserModel>(
          converter: (store) => store.state.user,
          builder: (context, user) => Column(
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
                user.name,
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
                user.location.hospitalName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.light,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.large),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                "Scan the vaccine batch to be used today",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.light,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.minititle),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "This becomes the dose info to be inserted into all badges for today",
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
                label: "Ready to Scan",
                onPressed: () {
                  StoreUtils.dispatch(
                      context, ActionUpdateScanType(scanType: "vaccine"));
                  RouteUtils.goToPage(context, AppRoutes.ScanQr);
                },
                trailingIcon: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
