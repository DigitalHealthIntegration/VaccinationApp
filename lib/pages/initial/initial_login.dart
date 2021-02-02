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
