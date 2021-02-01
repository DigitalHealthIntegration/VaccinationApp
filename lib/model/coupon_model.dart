import 'dart:convert';

CouponModel couponModelFromJson(String str) => CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
    CouponModel({
        this.type,
        this.id,
        this.coupons,
        this.phase,
        this.city,
        this.age,
        this.conditions,
        this.job,
    });

    String type;
    String id;
    String coupons;
    String phase;
    String city;
    String age;
    String conditions;
    String job;

    factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        type: json["type"],
        id: json["id"],
        coupons: json["coupons"],
        phase: json["phase"],
        city: json["city"],
        age: json["age"],
        conditions: json["conditions"],
        job: json["job"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "coupons": coupons,
        "phase": phase,
        "city": city,
        "age": age,
        "conditions": conditions,
        "job": job,
    };
}