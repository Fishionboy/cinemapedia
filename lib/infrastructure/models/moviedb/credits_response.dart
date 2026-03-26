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
    final String? knownForDepartment;
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
        this.adult,
        this.gender,
        this.knownForDepartment,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order,
        this.department,
        this.job,
    });

    factory CastDto.fromJson(Map<String, dynamic> json) => CastDto(
        id: json["id"],
        name: json["name"],
        adult: asBool(json["adult"]) ,
        gender: json["gender"] is int ? json["gender"] : null,
        knownForDepartment: json["known_for_department"]!,
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"] ?? 'https://i.pinimg.com/736x/2f/15/f2/2f15f2e8c688b3120d3d26467b06330c.jpg',
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath ?? 'https://i.pinimg.com/736x/2f/15/f2/2f15f2e8c688b3120d3d26467b06330c.jpg',
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
