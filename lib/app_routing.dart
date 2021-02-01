import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/pages/initial/recognized.dart';
import 'package:flutter_r1/pages/scan_qr.dart';
import 'package:flutter_r1/pages/initial/administrator.dart';
import 'package:flutter_r1/pages/initial/initial_login.dart';
import 'package:flutter_r1/pages/initial/location.dart';
import 'package:flutter_r1/pages/second/badge.dart';
import 'package:flutter_r1/pages/second/badge_production.dart';
import 'package:flutter_r1/pages/second/home.dart';
import 'package:flutter_r1/pages/second/passkey.dart';
import 'package:flutter_r1/pages/second/print_badge.dart';
import 'package:flutter_r1/pages/second/ready_administer.dart';
import 'package:flutter_r1/pages/second/recording_dose.dart';
import 'package:flutter_r1/pages/second/scan_result.dart';
import 'package:flutter_r1/pages/second/status.dart';
import 'package:flutter_r1/pages/share_qr.dart';
import 'package:flutter_r1/theme.dart';

class AppRouting extends StatelessWidget {
  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        accentColor: AppColors.secondary,
        buttonColor: AppColors.primary,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.InitialLogin,
      routes: {
        AppRoutes.InitialLogin: (context) => InitialLogin(),
        AppRoutes.Location: (context) => Location(),
        AppRoutes.Administrator: (context) => Administrator(),
        AppRoutes.ScanQr: (context) => ScanQr(),
        AppRoutes.VaccineRecognized: (context) => VaccineRecognized(),
        AppRoutes.Home: (context) => Home(),
        AppRoutes.RecordingDose: (context) => RecordingDose(),
        AppRoutes.CouponScan: (context) => ScanQr(),
        AppRoutes.ScanResult: (context) => ScanResult(),
        AppRoutes.AdministerReady: (context) => ReadyAdminister(),
        AppRoutes.BadgeProduction: (context) => BadgeProduction(),
        AppRoutes.BadgePrint: (context) => PrintBadge(),
        AppRoutes.PassKey: (context) => Passkey(),
        AppRoutes.Badge: (context) => Badge(),
        AppRoutes.Status: (context) => Status(),
        AppRoutes.ShareQr: (context) => ShareQr(),
      },
    );
  }
}
