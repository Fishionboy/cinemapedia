import 'package:cinemapedia/core/helpers/json_helpers.dart';

class MovieMovieDB {
    final int id;
    final bool adult;
    final String title;

    final List<int> genreIds;
    final String originalLanguage;
    final String? originalTitle;
    final String? overview;
    final double? voteAverage;
    final int? voteCount;
    final double? popularity;
    final DateTime? releaseDate;
    final bool? video;
    final String? posterPath;
    final String? backdropPath;

    MovieMovieDB({
        required this.id,
        required this.adult,
        required this.title,
        
        required this.genreIds,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.voteAverage,
        required this.voteCount,
        required this.popularity,
        required this.releaseDate,
        required this.video,
        required this.posterPath,
        required this.backdropPath,
    });

    factory MovieMovieDB.fromJson(Map<String, dynamic> json) => MovieMovieDB(
        id: json["id"]!, 
        adult: json["adult"]!, 
        title: json["title"]!,
        originalLanguage: json["original_language"]!,
        originalTitle: asString(json["original_title"]),
        overview: asString(json["overview"]),
        voteAverage: asDouble(json["vote_average"]),
        voteCount: asInt(json["vote_count"]),
        popularity: asDouble(json["popularity"]),
        releaseDate: json["release_date"] != null && (json["release_date"] as String).isNotEmpty
            ? DateTime.tryParse(json["release_date"])
            : null,
        video: asBool(json["video"]),
        posterPath: asString(json["poster_path"]),
        backdropPath: asString(json["backdrop_path"]),
        genreIds: json["genre_ids"] is List
            ? List<int>.from(json["genre_ids"].map((x) => x))
            : [],
      );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
