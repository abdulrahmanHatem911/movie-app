import '../../domain/entity/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required int id,
    required String title,
    required String backdropPath,
    required String posterPath,
    required List<int> genreIds,
    required String overview,
    required double voteAverage,
    required String releaseDate,
  }) : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          posterPath: posterPath,
          genreIds: genreIds,
          overview: overview,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
        );
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date'],
    );
  }
}
