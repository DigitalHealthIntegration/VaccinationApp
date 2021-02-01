import 'dart:convert';

VaccineModel vaccineModelFromJson(String str) =>
    VaccineModel.fromJson(json.decode(str));

String vaccineModelToJson(VaccineModel data) => json.encode(data.toJson());

class VaccineModel {
  VaccineModel({
    this.manufacturer,
    this.lotNo,
  });

  String manufacturer;
  String lotNo;

  factory VaccineModel.fromJson(Map<String, dynamic> json) => VaccineModel(
        manufacturer: json["manufacturer"],
        lotNo: json["lot_no"],
      );

  Map<String, dynamic> toJson() => {
        "manufacturer": manufacturer,
        "lot_no": lotNo,
      };
}
