import 'dart:convert';
import 'package:cinemapedia/core/helpers/json_helpers.dart';

ActorResponse actorByIdFromJson(String str) => ActorResponse.fromJson(json.decode(str));

String actorByIdToJson(ActorResponse data) => json.encode(data.toJson());

class ActorResponse {
  final ActorDto actorDto;

  ActorResponse({   
    required this.actorDto
    });

    factory ActorResponse.fromJson(Map<String, dynamic> json) => ActorResponse(
      actorDto: ActorDto.fromJson(json),
      );

      Map<String, dynamic> toJson() =>{
        "actorDto": actorDto
      };
     
}

class ActorDto {  
  final int gender;
  final int id;
  final String imdbId;
  final String name;

  final DateTime? deathday;
  final bool? adult;
  final List<String>? alsoKnownAs;
  final String? biography;
  final DateTime? birthday;
  final String? homepage;
  final String? knownForDepartment;
  final String? placeOfBirth;
  final double? popularity;
  final String? profilePath;

    ActorDto({
      required this.deathday,
      required this.gender,
      required this.id,
      required this.imdbId,
      required this.name,

      required this.adult,
      required this.alsoKnownAs,
      required this.biography,
      required this.birthday,
      required this.homepage,
      required this.knownForDepartment,
      required this.placeOfBirth,
      required this.popularity,
      required this.profilePath,
    });

    factory ActorDto.fromJson(Map<String, dynamic> json) => ActorDto(       
        gender: json["gender"],
        id: json["id"],
        imdbId: json["imdb_id"],
        name: json["name"],

        deathday:json["deathday"] != null 
          ? DateTime.tryParse(json["deathday"])
          : null,
        adult: asBool(json["adult"]),
        alsoKnownAs: json["also_known_as"] != null
            ? List<String>.from(
                (json["also_known_as"] as List)
                    .map((x) => asString(x))
                    .whereType<String>())
            : null,
        biography: asString(json["biography"]),
        birthday: json["birthday"] != null &&
                (json["birthday"] as String).isNotEmpty
            ? DateTime.tryParse(json["birthday"])
            : null,
        homepage: asString(json["homepage"]),
        knownForDepartment: asString(json["known_for_department"]),
        placeOfBirth: asString(json["place_of_birth"]),
        popularity: asDouble(json["popularity"]),
        profilePath: asString(json["profile_path"]),
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "also_known_as":alsoKnownAs != null 
          ? List<dynamic>.from(alsoKnownAs!.map((x) => x)) 
          : null,
        "biography": biography,
        "birthday": birthday,
        "deathday": deathday,
        "gender": gender,
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "known_for_department": knownForDepartment,
        "name": name,
        "place_of_birth": placeOfBirth,
        "popularity": popularity,
        "profile_path": profilePath,
    };
}
