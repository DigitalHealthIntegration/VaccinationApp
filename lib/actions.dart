import 'package:flutter_r1/model/coupon_model.dart';
import 'package:flutter_r1/model/user_model.dart';
import 'package:flutter_r1/model/vaccine_model.dart';

class ActionUpdateUser {
  UserModel user;
  ActionUpdateUser({this.user});
}

class ActionUpdateVaccine {
  VaccineModel vaccine;
  ActionUpdateVaccine({this.vaccine});
}

class ActionUpdateCoupon {
  CouponModel coupon;
  ActionUpdateCoupon({this.coupon});
}
