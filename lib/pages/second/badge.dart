import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:flutter_r1/widgets/textinput.dart';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:async';
import 'package:simple_rsa/simple_rsa.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_r1/actions.dart';
import 'dart:convert';


class Badge extends StatelessWidget {
  String pat_date, pat_manuf, pat_product, pat_lot, pat_route, pat_site, pat_dosage, pat_doses, pat_next_dose, pat_vaccinator, pat_pass_key;

  Future<String> getBadgeQrString(String message) async {
    String privateKey, publicKey;
    privateKey = await loadPrivateKeyFromAsset();
    publicKey = await loadPublicKeyFromAsset();
    final signature = await signString(message, privateKey);
    print("publicKey :-:"+publicKey);
    print("signature  :: "+signature);
    print("message :: "+message);

    String elemPref = "qr-coupon";
    String protocol = "healthpass";
    String crypto = "SHA256";
    String uri = protocol+":"+crypto+"\\"+signature+"@"+publicKey+"?"+message;
    print(">>>>>>>uri>>>>>>>>>>>>"+uri);

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
                TextInput(
                  onChange: (str) {
                    pat_date = str;
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
                    pat_manuf = str;
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
                    pat_product = str;
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
                    pat_lot = str;
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
                    pat_route  = str;
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
                    pat_site = str;
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
                    pat_dosage = str;
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
                    pat_doses = str;
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
                     pat_next_dose = str;
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
                    pat_vaccinator = str;
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
                    pat_pass_key = str;
                  },
                  placeholder: "Passkey",
                ),
                SizedBox(
                  height: 10,
                ),
                Button(
                  onPressed: () async {
                    String badge_str = "";

                    if(pat_date!= null && pat_date.trim().length > 0){
                      badge_str += ("&date=")+pat_date;
                    }
                    if(pat_manuf!= null && pat_manuf.trim().length > 0){
                      badge_str += ("&manuf=")+pat_manuf;
                    }
                    if(pat_product!= null && pat_product.trim().length > 0){
                      badge_str += ("&name=")+pat_product;
                    }
                    if(pat_lot!= null && pat_lot.trim().length > 0){
                      badge_str += ("&lot=")+pat_lot;
                    }
                    if(pat_route!= null && pat_route.trim().length > 0){
                      badge_str += ("&route=")+pat_route;
                    }
                    if(pat_site!= null && pat_site.trim().length > 0){
                      badge_str += ("&site=")+pat_site;
                    }if(pat_dosage!= null && pat_dosage.trim().length > 0){
                      badge_str += ("&=dose")+pat_dosage;
                    }
                    if(pat_doses!= null && pat_doses.trim().length > 0){
                      badge_str += ("&required_doses=")+pat_doses;
                    }if(pat_next_dose!= null && pat_next_dose.trim().length > 0){
                      badge_str += ("&next_dose_in_days=")+pat_next_dose;
                    }
                    if(pat_vaccinator!= null && pat_vaccinator.trim().length > 0){
                      badge_str += ("&vaccinator=")+pat_vaccinator;
                    }
                    // if(pat_pass_key!= null && pat_pass_key.trim().length > 0){
                    //   badge_str += ("&vaccinee=")+pat_pass_key;
                    // }
                    String finalString = "type=badge"+badge_str;

                    //this is for pass key
                    List<int> bytes = utf8.encode(finalString);
                    String hash = sha256.convert(bytes).toString();
                    finalString += ("&vaccinee=")+hash;

                    String qrString = await getBadgeQrString(finalString);
                    StoreUtils.dispatch(context, ActionUpdateShareQrString(shareQrString: qrString) );
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