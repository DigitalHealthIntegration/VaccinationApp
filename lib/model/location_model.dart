class LocationModel {
  int id;
  String hospitalName;
  String city;

  LocationModel({this.id, this.hospitalName, this.city});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        hospitalName: json["hospital_name"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_name": hospitalName,
        "city": city,
      };
}
