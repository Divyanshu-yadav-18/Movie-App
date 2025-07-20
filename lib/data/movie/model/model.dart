class MovieModel {
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final bool? adult;
  final String? originalLanguage;
  final List<int> genreIds;
  final double? popularity;
  final DateTime? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieModel({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json["backdrop_path"] as String?,
      id: json["id"] as int?,
      title: json["title"] as String?,
      originalTitle: json["original_title"] as String?,
      overview: json["overview"] as String?,
      posterPath: json["poster_path"] as String?,
      adult: json["adult"] as bool?,
      originalLanguage: json["original_language"] as String?,
      genreIds: (json["genre_ids"] as List<dynamic>?)
              ?.map((id) => id as int)
              .toList() ??
          [],
      popularity: (json["popularity"] as num?)?.toDouble(),
      releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
      video: json["video"] as bool?,
      voteAverage: (json["vote_average"] as num?)?.toDouble(),
      voteCount: json["vote_count"] as int?,
    );
  }
}
