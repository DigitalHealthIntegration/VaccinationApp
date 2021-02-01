import 'package:flutter/material.dart';
import 'package:flutter_r1/model/location_model.dart';
import 'package:flutter_r1/model/user_model.dart';

class AppStore {
  UserModel user;
  List<LocationModel> locations;
  AppStore({@required this.locations, this.user});
}
