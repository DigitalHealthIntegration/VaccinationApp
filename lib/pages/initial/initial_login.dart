import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_r1/actions.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/containers/application_page.dart';
import 'package:flutter_r1/controllers/google_sign_in.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/model/user_model.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';
import 'package:flutter_r1/widgets/gradients.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:crypto/crypto.dart';
import 'dart:async';
import 'package:simple_rsa/simple_rsa.dart';
import 'package:http/http.dart' as http;

class InitialLogin extends StatelessWidget {
  verifivationTest() async {
    String pubKey = "vitorpamplona.com/vaccine-certificate-qrcode-generator/pub_key";
    String privateKey = "-----BEGIN RSA PRIVATE KEY-----MIICXQIBAAKBgQDlOJu6TyygqxfWT7eLtGDwajtNFOb9I5XRb6khyfD1Yt3YiCgQWMNW649887VGJiGr/L5i2osbl8C9+WJTeucF+S76xFxdU6jE0NQ+Z+zEdhUTooNRaY5nZiu5PgDB0ED/ZKBUSLKL7eibMxZtMlUDHjm4gwQco1KRMDSmXSMkDwIDAQABAoGAfY9LpnuWK5Bs50UVep5c93SJdUi82u7yMx4iHFMc/Z2hfenfYEzu+57fI4fvxTQ//5DbzRR/XKb8ulNv6+CHyPF31xk7YOBfkGI8qjLoq06V+FyBfDSwL8KbLyeHm7KUZnLNQbk8yGLzB3iYKkRHlmUanQGaNMIJziWOkN+N9dECQQD0ONYRNZeuM8zd8XJTSdcIX4a3gy3GGCJxOzv16XHxD03GW6UNLmfPwenKu+cdrQeaqEixrCejXdAFz/7+BSMpAkEA8EaSOeP5Xr3ZrbiKzi6TGMwHMvC7HdJxaBJbVRfApFrE0/mPwmP5rN7QwjrMY+0+AbXcm8mRQyQ1+IGEembsdwJBAN6az8Rv7QnD/YBvi52POIlRSSIMV7SwWvSK4WSMnGb1ZBbhgdg57DXaspcwHsFV7hByQ5BvMtIduHcT14ECfcECQATeaTgjFnqE/lQ22Rk0eGaYO80cc643BXVGafNfd9fcvwBMnk0iGX0XRsOozVt5AzilpsLBYuApa66NcVHJpCECQQDTjI2AQhFc1yRnCU/YgDnSpJVm1nASoRUnU8Jfm3Ozuku7JUXcVpt08DFSceCEX9unCuMcT72rAQlLpdZir876-----END RSA PRIVATE KEY-----";

    String message = "type=passkey&name=mono&phone=0995404601&salt=v6rjkvirkj";
    List<int> bytes = utf8.encode('type=passkey&name=mono&phone=0995404601&salt=v6rjkvirkj');
    String hash = sha256.convert(bytes).toString();
    print(">>> "+hash);

    final signture = await signString(message, privateKey);
    print(" :: "+signture);

    Future<String> getPubKey = getPublicKeyAndVerify(message,signture, pubKey);
    getPubKey.then((value) => print(value));

    getCuponInfoFromQR("");

  }
  Future<String> getPublicKeyAndVerify(String message,String signture,String pubKey) async {
    print("======> "+"https://"+pubKey);
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
  getCuponInfoFromQR(String cupponQrString){
    cupponQrString =  "healthpass:SHA256\4N2pSW4ipOFw3gDnQijAZwprF3tEwWtobe3clqxjM6Q7W+ahhw1Ks+3oznUwqlv9C86KOt7GzClpMiqgsBKB65JOtozJOMvz4N/0ZfjsT2pa7VllNDTnXBLKCc0sgQMF1w3HG0MHCTQwJwRUKqRRHjahfrYdvcOlUjhvoQ0lnVg=@vitorpamplona.com/vaccine-certificate-qrcode-generator/pub_key?type=status&vaccinee=56694fd8b482409c1c8e62aaf0d9e6952ca5ab4347959ab0a06fac51b8235c79";
        String cuponData = cupponQrString.substring(cupponQrString.indexOf("/pub_key?")+9);
    Map qrMap = new Map();
    var arr = cuponData.split("&");
    for(var i=0; i< arr.length; i++){
      String str = arr[i];
      var local = str.split("=");
      qrMap.putIfAbsent(local[0], () => local[1]);
    }
    print(qrMap);

  }
  Future<String> readFromFile() async {
    try {
      loadPrivateKeyFromAsset().then((value) => print(value));
      print("------------------------------------------------");
      loadPublicKeyFromAsset().then((value) => print(value));
    } catch (e) {
      print("Couldn't read file");
    }
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/logo.png"),
            height: 150.0,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Hello!",
            style: TextStyle(
                color: AppColors.light,
                fontWeight: FontWeight.w500,
                fontSize: FontSize.title),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Login to begin the day",
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
            label: "LOGIN",
            trailingImage: Image(
              image: AssetImage("assets/google_logo.png"),
              height: 20,
            ),
            onPressed: () async {
              GoogleSignInService googleSignInService = GoogleSignInService();
              User user = await googleSignInService.signInWithGoogle();
              if (user != null) {
                StoreUtils.dispatch(context,
                    ActionUpdateUser(user: UserModel(name: user.displayName)));
                RouteUtils.goToPage(context, AppRoutes.Location);
              }
              print("-----------");

             // readFromFile();
              //verifivationTest();
            },
          ),
        ],
      ),
    );
  }
}
