import 'package:flutter/material.dart';
import 'package:flutter_r1/model/location_model.dart';
import 'package:flutter_r1/model/user_model.dart';
import 'package:flutter_r1/model/vaccine_model.dart';

class AppStore {
  UserModel user;
  List<LocationModel> locations;
  VaccineModel vaccine;
  AppStore({@required this.locations, this.user, this.vaccine});
}
