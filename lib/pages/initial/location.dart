import 'package:flutter/material.dart';
import 'package:flutter_r1/actions.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/shared_preference.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/model/location_model.dart';
import 'package:flutter_r1/model/user_model.dart';
import 'package:flutter_r1/store.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  LocationModel location;

  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      body: StoreConnector<AppStore, AppStore>(
        converter: (store) => store.state,
        builder: (context, store) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome back\n${store.user.name}",
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
                child: DropdownButton<LocationModel>(
                  icon: Icon(Icons.arrow_drop_down),
                  value: location,
                  iconSize: 24,
                  onChanged: (LocationModel newValue) {
                    setState(() {
                      location = newValue;
                    });
                  },
                  hint: Text("Select Location"),
                  isExpanded: true,
                  items: store.locations.map<DropdownMenuItem<LocationModel>>(
                      (LocationModel value) {
                    return DropdownMenuItem<LocationModel>(
                      value: value,
                      child: Text(value.hospitalName),
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
              onPressed: location != null
                  ? () async {
                      UserModel user =
                          UserModel(name: store.user.name, location: location);
                      StoreUtils.dispatch(
                          context, ActionUpdateUser(user: user));
                      await SharedPreferencesUtils.setString(
                          SharedPreferenceKeys.user, userModelToJson(user));
                      RouteUtils.goToPage(context, AppRoutes.Administrator);
                    }
                  : null,
              trailingIcon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
