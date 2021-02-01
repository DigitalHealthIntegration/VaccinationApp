class LocationModel {
  int id;
  String hospitalName;
  String city;

  LocationModel({this.id, this.hospitalName, this.city});

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_name": hospitalName,
        "city": city,
    };
}
