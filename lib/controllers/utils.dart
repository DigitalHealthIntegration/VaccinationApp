import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_r1/store.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_redux/flutter_redux.dart';

class RouteUtils {
  static Future goToPage(BuildContext context, String route,
      {dynamic arguments}) {
    return Navigator.pushNamed(context, route, arguments: arguments);
  }

  static Future setRootPage(BuildContext context, String route) {
    return Navigator.pushNamedAndRemoveUntil(context, route, (r) => false);
  }

  static void goBack(BuildContext context) {
    return Navigator.pop(context);
  }
}

class StoreUtils {
  static void dispatch(context, action) {
    final store = StoreProvider.of<AppStore>(context);
    store.dispatch(action);
  }
}

class Utils {
  static void showAlertDialog(
      String message, BuildContext context, Function onCancel) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text(message),
              actions: [
                Button(
                    label: "Cancel",
                    borderRadius: 8.0,
                    padding: EdgeInsets.all(12.0),
                    color: AppColors.danger,
                    onPressed: () {
                      onCancel();
                      Navigator.of(context).pop();
                    }),
              ],
            ));
  }
}
