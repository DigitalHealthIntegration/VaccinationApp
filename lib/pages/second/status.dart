import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:flutter_r1/widgets/textinput.dart';
import 'dart:async';
import 'package:simple_rsa/simple_rsa.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_r1/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_r1/store.dart';

// ignore: must_be_immutable
class Status extends StatelessWidget {
  String patDose, patPasskey;

  Future<String> getStatusQrString(String message) async {
    String privateKey, publicKey;
    privateKey = await loadPrivateKeyFromAsset();
    publicKey = await loadPublicKeyFromAsset();
    final signature = await signString(message, privateKey);
    print("publicKey :-:" + publicKey);
    print("signature  :: " + signature);
    print("message :: " + message);

    // String elemPref = "qr-coupon";
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
    print(">>>>>>>uri status>>>>>>>>>>>>" + uri);

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
      appBarTitle: PageTitles.Status,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                    patDose = str;
                  },
                  placeholder: "0, 1, 2",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "PassKey",
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
                    patPasskey = passkey;
                  },
                  converter: (store) => store.state.passKey,
                  builder: (context, passkey) => TextInput(
                    value: passkey,
                    readOnly: false,
                    onChange: (str) {
                      patPasskey = str;
                    },
                    placeholder: "User Hash",
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Button(
                  onPressed: () async {
                    String statusStr = "";

                    if (patDose != null && patDose.trim().length > 0) {
                      statusStr += ("&vaccinated=") + patDose;
                    }
                    // if(patPasskey!= null && patPasskey.trim().length > 0){
                    //   statusStr += ("&manuf=")+patPasskey;
                    // }
                    String finalString = "type=status" + statusStr;
                    /* List<int> bytes = utf8.encode(finalString);
                    String hash = sha256.convert(bytes).toString();*/
                    if (patPasskey.length > 0)
                      finalString += ("&vaccinee=") + patPasskey;

                    String qrString = await getStatusQrString(finalString);
                    StoreUtils.dispatch(context,
                        ActionUpdateShareQrString(shareQrString: qrString));
                    RouteUtils.goToPage(context, AppRoutes.ShareQr,
                        arguments: "Status");
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
