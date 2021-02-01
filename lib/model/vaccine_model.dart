import 'dart:convert';

VaccineModel vaccineModelFromJson(String str) => VaccineModel.fromJson(json.decode(str));

String vaccineModelToJson(VaccineModel data) => json.encode(data.toJson());

class VaccineModel {
    VaccineModel({
        this.id,
        this.manufacturer,
        this.lotNo,
    });

    String id;
    String manufacturer;
    String lotNo;

    factory VaccineModel.fromJson(Map<String, dynamic> json) => VaccineModel(
        id: json["id"],
        manufacturer: json["manufacturer"],
        lotNo: json["lot_no"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "manufacturer": manufacturer,
        "lot_no": lotNo,
    };
}