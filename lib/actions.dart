import 'package:flutter_r1/model/coupon_model.dart';
import 'package:flutter_r1/model/user_model.dart';
import 'package:flutter_r1/model/vaccine_model.dart';

import 'model/coupon_model.dart';

class ActionUpdateUser {
  UserModel user;
  ActionUpdateUser({this.user});
}

class ActionUpdateVaccine {
  VaccineModel vaccine;
  ActionUpdateVaccine({this.vaccine});
}

class ActionUpdateShareQrString {
  String shareQrString;
  ActionUpdateShareQrString({this.shareQrString});
}

class ActionUpdateCoupon {
  CouponModel coupon;
  ActionUpdateCoupon({this.coupon});
}

class ActionUpdateScanType {
  String scanType;
  ActionUpdateScanType({this.scanType});
}

class ActionUpdatePassKey {
  String passKey;
  ActionUpdatePassKey({this.passKey});
}
