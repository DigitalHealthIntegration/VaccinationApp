import 'dart:convert';

import 'package:flutter_r1/model/location_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.name,
        this.location,
    });

    String name;
    LocationModel location;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "location": location.toJson(),
    };
}