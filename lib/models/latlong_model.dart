import 'dart:convert';

LongLat longLatFromJson(String str) => LongLat.fromJson(json.decode(str));

String longLatToJson(LongLat data) => json.encode(data.toJson());

class LongLat {
  LongLat({
    required this.uid,
    required this.longIni,
    required this.latIni,
    required this.longEnd,
    required this.latEnd,
  });

  String uid;
  String longIni;
  String latIni;
  String longEnd;
  String latEnd;

  factory LongLat.fromJson(Map<String, dynamic> json) => LongLat(
        uid: json["uid"],
        longIni: json["long_ini"],
        latIni: json["lat_ini"],
        longEnd: json["long_end"],
        latEnd: json["lat_end"],
      );
  factory LongLat.created() => LongLat(
        uid: "",
        longIni: "",
        latIni: "",
        longEnd: "",
        latEnd: "",
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "long_ini": longIni,
        "lat_ini": latIni,
        "long_end": longEnd,
        "lat_end": latEnd,
      };
}
