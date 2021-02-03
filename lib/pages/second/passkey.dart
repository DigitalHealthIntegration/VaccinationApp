import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
import 'dart:async';
import 'package:simple_rsa/simple_rsa.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_r1/actions.dart';

class Passkey extends StatelessWidget {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  String pat_name, pat_phone, pat_dob, pat_salt;

  String input_str = "";
  Future<String> getPublicKeyAndVerify(
      String message, String signture, String pubKey) async {
    final response = await http.get("https://" + pubKey);

    if (response.statusCode == 200) {
      var jsonResponse = response.body;

      var isVarify = await verifyString(message, signture, jsonResponse);
      print(isVarify);
      return isVarify.toString();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<String> verifivationTest(String message) async {
    String privateKey, publicKey;
    privateKey = await loadPrivateKeyFromAsset();
    publicKey = await loadPublicKeyFromAsset();
    final signature = await signString(message, privateKey);
    print("publicKey :-:" + publicKey);
    print("signature  :: " + signature);
    print("message :: " + message);

    //String message = "type=passkey&name=mono&phone=0995404601&salt=v6rjkvirkj";
    // List<int> bytes = utf8.encode('type=passkey&name=mono&phone=0995404601&salt=v6rjkvirkj');
    // String hash = sha256.convert(bytes).toString();
    // // print(">>> "+hash);

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

    return uri;
  }

  Future<String> loadPrivateKeyFromAsset() async {
    return await rootBundle.loadString('assets/private_key_info.key');
  }

  Future<String> loadPublicKeyFromAsset() async {
    return await rootBundle.loadString('assets/public_key_info.key');
  }

  getCuponInfoFromQR(String cupponQrString) {
    //  cupponQrString =  "healthpass:SHA256\4N2pSW4ipOFw3gDnQijAZwprF3tEwWtobe3clqxjM6Q7W+ahhw1Ks+3oznUwqlv9C86KOt7GzClpMiqgsBKB65JOtozJOMvz4N/0ZfjsT2pa7VllNDTnXBLKCc0sgQMF1w3HG0MHCTQwJwRUKqRRHjahfrYdvcOlUjhvoQ0lnVg=@vitorpamplona.com/vaccine-certificate-qrcode-generator/pub_key?type=status&vaccinee=56694fd8b482409c1c8e62aaf0d9e6952ca5ab4347959ab0a06fac51b8235c79";
    String cuponData =
        cupponQrString.substring(cupponQrString.indexOf("/pub_key?") + 9);
    if (cuponData == null) {
      return;
    }
    Map qrMap = new Map();
    var arr = cuponData.split("&");
    for (var i = 0; i < arr.length; i++) {
      String str = arr[i];
      var local = str.split("=");
      qrMap.putIfAbsent(local[0], () => local[1]);
    }
    print(qrMap);
  }

  @override
  Widget build(BuildContext context) {
    pat_salt = Utils.generateRandom10();

    return ApplicationPage(
      gradient: Gradients.gradient1,
      appBarTitle: PageTitles.PassKey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Name",
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
                  placeholder: "Patient Name",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Phone",
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
                    pat_phone = str;
                  },
                  placeholder: "617 ..",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "DoB",
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
                      pat_dob = dateFormat.format(selectedDate);
                    }),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Salt",
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
                    //pat_dob = str;
                  },
                  placeholder: pat_salt,
                ),
                SizedBox(
                  height: 50,
                ),
                Button(
                  onPressed: () async {
                    if (pat_name != null && pat_name.trim().length > 0) {
                      input_str += ("&name=") + pat_name;
                    }
                    if (pat_phone != null && pat_phone.trim().length > 0) {
                      input_str += ("&phone=") + pat_phone;
                    }
                    if (pat_dob != null && pat_dob.trim().length > 0) {
                      input_str += ("&dob=") + pat_dob;
                    }
                    if (pat_salt != null && pat_salt.trim().length > 0) {
                      input_str += ("&salt=") + pat_salt;
                    }

                    String finalString = "type=passkey" + input_str;

                    // generating pass key and saving
                    print("passkey" + finalString);
                    List<int> bytes = utf8.encode(finalString);
                    String pass_key_global = sha256.convert(bytes).toString();
                    StoreUtils.dispatch(
                        context, ActionUpdatePassKey(passKey: pass_key_global));

                    String qrString = await verifivationTest(finalString);
                    StoreUtils.dispatch(context,
                        ActionUpdateShareQrString(shareQrString: qrString));
                    RouteUtils.goToPage(context, AppRoutes.ShareQr,
                        arguments: "Passkey");
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
