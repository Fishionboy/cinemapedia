import 'dart:convert';

import 'package:cinemapedia/core/helpers/json_helpers.dart';

CreditsResponse movieDetailsFromJson(String str) => CreditsResponse.fromJson(json.decode(str));

String movieDetailsToJson(CreditsResponse data) => json.encode(data.toJson());

class CreditsResponse {
    final int id;
    final List<CastDto> cast;
    final List<CastDto> crew;

    CreditsResponse({
        required this.id,
        required this.cast,
        required this.crew,
    });

    factory CreditsResponse.fromJson(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<CastDto>.from(json["cast"].map((x) => CastDto.fromJson(x))),
        crew: List<CastDto>.from(json["crew"].map((x) => CastDto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
    };
}

class CastDto {
    final int id;
    final String name;

    final bool? adult;
    final int? gender;
    final List<String>? knownForDepartment;
    final String? originalName;
    final double? popularity;
    final String? profilePath;
    final int? castId;
    final String? character;
    final String? creditId;
    final int? order;
    final String? department;
    final String? job;

    CastDto({
      required this.id,
      required this.name,

      required this.adult,
      required this.gender,
      required this.knownForDepartment,
      required this.originalName,
      required this.popularity,
      required this.profilePath,
      required this.castId,
      required this.character,
      required this.creditId,
      required this.order,
      required this.department,
      required this.job,
    });

    factory CastDto.fromJson(Map<String, dynamic> json) => CastDto(
        id: json["id"]!,
        name: json["name"]!,
        adult: asBool(json["adult"]) ,
        gender: asInt(json["gender"]),
        knownForDepartment:json["also_known_as"] != null 
          ? List<String>.from(json["also_known_as"].map((x) =>asString(x)))
          : null ,
        originalName: asString(json["original_name"]),
        popularity: asDouble(json["popularity"]),
        profilePath: asString(json["profile_path"]) ,
        character: asString(json["character"]),
        creditId: asString(json["credit_id"]),
        order: asInt(json["order"]),
        department: asString(json["department"]),
        job: asString(json["job"]),
        castId: asInt(json["cast_id"])
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
        
    };
}

// enum Department {
//     ACTING,
//     ART,
//     CAMERA,
//     COSTUME_MAKE_UP,
//     CREW,
//     DIRECTING,
//     EDITING,
//     LIGHTING,
//     PRODUCTION,
//     SOUND,
//     VISUAL_EFFECTS,
//     WRITING
// }

// final departmentValues = EnumValues({
//     "Acting": Department.ACTING,
//     "Art": Department.ART,
//     "Camera": Department.CAMERA,
//     "Costume & Make-Up": Department.COSTUME_MAKE_UP,
//     "Crew": Department.CREW,
//     "Directing": Department.DIRECTING,
//     "Editing": Department.EDITING,
//     "Lighting": Department.LIGHTING,
//     "Production": Department.PRODUCTION,
//     "Sound": Department.SOUND,
//     "Visual Effects": Department.VISUAL_EFFECTS,
//     "Writing": Department.WRITING
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }
