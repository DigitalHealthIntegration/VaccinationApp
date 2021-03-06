import 'package:flutter/material.dart';
import 'package:flutter_r1/model/coupon_model.dart';
import 'package:flutter_r1/model/location_model.dart';
import 'package:flutter_r1/model/user_model.dart';
import 'package:flutter_r1/model/vaccine_model.dart';

class AppStore {
  String initialRoute;
  UserModel user;
  List<LocationModel> locations;
  VaccineModel vaccine;
  String shareQrString;
  CouponModel coupon;
  String scanType;
  String passKey;

  AppStore({
    @required this.locations,
    this.initialRoute,
    this.user,
    this.vaccine,
    this.coupon,
    this.shareQrString,
    this.scanType = "vaccine",
    this.passKey = "",
  });
}
