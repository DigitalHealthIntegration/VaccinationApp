import 'dart:convert';

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

class Passkey extends StatelessWidget {

  String pat_name, pat_phone, pat_dob, pat_satl;
  String input_str = "";
  Future<String> getPublicKeyAndVerify(String message,String signture,String pubKey) async {
    final response =  await http.get("https://"+pubKey);

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
    print("publicKey :-:"+publicKey);
    print("signature  :: "+signature);
    print("message :: "+message);

    //String message = "type=passkey&name=mono&phone=0995404601&salt=v6rjkvirkj";
    // List<int> bytes = utf8.encode('type=passkey&name=mono&phone=0995404601&salt=v6rjkvirkj');
    // String hash = sha256.convert(bytes).toString();
    // // print(">>> "+hash);



    String elemPref = "qr-coupon";
    String protocol = "healthpass";
    String crypto = "SHA256";
    String uri = protocol+":"+crypto+"\\"+signature+"@"+publicKey+"?"+message;
    print(">>>>>>>>>>>>>>>>>>>"+uri);

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
     Random random = new Random(36);
     String randomNumber = random.nextDouble().toString();
     pat_satl = randomNumber.toString().substring(3);
     print(">>>>>>"+pat_satl);


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
                  placeholder: "Phone",
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
                TextInput(
                  onChange: (str) {
                    pat_dob = str;
                  },
                  placeholder: "DoB",
                ),
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
                  placeholder: pat_satl,
                ),
                SizedBox(
                  height: 50,
                ),
                Button(
                  onPressed: () async {
                    if(pat_name!= null && pat_name.trim().length > 0){
                      input_str += ("&name=")+pat_name;
                    }
                    if( pat_phone != null && pat_phone.trim().length > 0){
                      input_str += ("&phone=")+pat_phone;
                    }
                    if(pat_dob != null &&  pat_dob.trim().length > 0){
                      input_str += ("&dob=")+pat_dob;
                    }
                    if(pat_satl != null &&  pat_satl.trim().length > 0){
                      input_str += ("&salt=")+pat_satl;
                    }

                    String finalString = "type=passkey"+input_str;
                    // List<int> bytes = utf8.encode(finalString);
                    // String hash = sha256.convert(bytes).toString();

                    String qrString = await verifivationTest(finalString);
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
