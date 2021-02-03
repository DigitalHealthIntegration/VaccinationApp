import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/date_picker.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:flutter_r1/widgets/textinput.dart';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:simple_rsa/simple_rsa.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_r1/store.dart';
import 'package:flutter_r1/actions.dart';
import 'dart:convert';

class Badge extends StatelessWidget {
  String pat_date,
      pat_manuf,
      pat_product,
      pat_lot,
      pat_route,
      pat_site,
      pat_dosage,
      pat_doses,
      pat_next_dose,
      pat_vaccinator,
      pat_pass_key;

  DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  Future<String> getBadgeQrString(String message) async {
    String privateKey, publicKey;
    privateKey = await loadPrivateKeyFromAsset();
    publicKey = await loadPublicKeyFromAsset();
    final signature = await signString(message, privateKey);
    print("publicKey :-:" + publicKey);
    print("signature  :: " + signature);
    print("message :: " + message);

    String elemPref = "qr-coupon";
    String protocol = "healthpass";
    String crypto = "SHA256";
    String uri = protocol +
        ":" +
        crypto +
        "\\" +
        signature +
        "@" +
        publicKey +
        "?" +
        message;
    print(">>>>>>>uri>>>>>>>>>>>>" + uri);

    return uri;
  }

  Future<String> loadPrivateKeyFromAsset() async {
    return await rootBundle.loadString('assets/private_key_info.key');
  }

  Future<String> loadPublicKeyFromAsset() async {
    return await rootBundle.loadString('assets/public_key_info.key');
  }

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
                DatePicker(
                    lastDate: DateTime(DateTime.now().year + 50),
                    firstDate: DateTime(DateTime.now().year - 50),
                    initialDate: DateTime.now(),
                    filled: true,
                    placeholder: "YYYY-MM-DD",
                    dateFormat: dateFormat,
                    initiallySelected: false,
                    onDateChanged: (selectedDate) {
                      pat_date = dateFormat.format(selectedDate);
                      print(pat_date);
                    }),
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
                    pat_manuf = str;
                  },
                  placeholder: "Pfizer, Moderna, etc",
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
                    pat_product = str;
                  },
                  placeholder: "COVID-19",
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
                    pat_lot = str;
                  },
                  placeholder: "012L20A, ...",
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
                    pat_route = str;
                  },
                  placeholder: "Intramuscular, Intranasal, Subcut, Oral, ...",
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
                    pat_site = str;
                  },
                  placeholder: "Right Arm, Left Arm, ...",
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
                    pat_dosage = str;
                  },
                  placeholder: "1.0ml, 0.5ml, ...",
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
                    pat_doses = str;
                  },
                  placeholder: "1, 2, 3, ...",
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
                    pat_next_dose = str;
                  },
                  placeholder: "21, 28, ...",
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
                    pat_vaccinator = str;
                  },
                  placeholder: "Pharmacy Name, City, ...",
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
                StoreConnector<AppStore, String>(
                  onInitialBuild: (passkey) {
                    pat_pass_key = passkey;
                  },
                  converter: (store) => store.state.passKey,
                  builder: (context, passkey) => TextInput(
                    value: passkey,
                    readOnly: false,
                    onChange: (str) {
                      pat_pass_key = str;
                    },
                    placeholder: "User Hash",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Button(
                  onPressed: () async {
                    String badge_str = "";

                    if (pat_date != null && pat_date.trim().length > 0) {
                      badge_str += ("&date=") + pat_date;
                    }
                    if (pat_manuf != null && pat_manuf.trim().length > 0) {
                      badge_str += ("&manuf=") + pat_manuf;
                    }
                    if (pat_product != null && pat_product.trim().length > 0) {
                      badge_str += ("&name=") + pat_product;
                    }
                    if (pat_lot != null && pat_lot.trim().length > 0) {
                      badge_str += ("&lot=") + pat_lot;
                    }
                    if (pat_route != null && pat_route.trim().length > 0) {
                      badge_str += ("&route=") + pat_route;
                    }
                    if (pat_site != null && pat_site.trim().length > 0) {
                      badge_str += ("&site=") + pat_site;
                    }
                    if (pat_dosage != null && pat_dosage.trim().length > 0) {
                      badge_str += ("&=dose") + pat_dosage;
                    }
                    if (pat_doses != null && pat_doses.trim().length > 0) {
                      badge_str += ("&required_doses=") + pat_doses;
                    }
                    if (pat_next_dose != null &&
                        pat_next_dose.trim().length > 0) {
                      badge_str += ("&next_dose_in_days=") + pat_next_dose;
                    }
                    if (pat_vaccinator != null &&
                        pat_vaccinator.trim().length > 0) {
                      badge_str += ("&vaccinator=") + pat_vaccinator;
                    }
                    // if(pat_pass_key!= null && pat_pass_key.trim().length > 0){
                    //   badge_str += ("&vaccinee=")+pat_pass_key;
                    // }
                    String finalString = "type=badge" + badge_str;

                    //this is for pass key
                    /*List<int> bytes = utf8.encode(finalString);
                    String hash = sha256.convert(bytes).toString();*/
                    if (pat_pass_key.length > 0) {
                      finalString += ("&vaccinee=") + pat_pass_key;
                    }
                    print("finalString from badge : " + finalString);
                    String qrString = await getBadgeQrString(finalString);
                    StoreUtils.dispatch(context,
                        ActionUpdateShareQrString(shareQrString: qrString));
                    RouteUtils.goToPage(context, AppRoutes.ShareQr,
                        arguments: "Badge");
                  },
                  label: "Generate QR",
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
