import 'package:film/movie/domain/entity/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.runtime,
    required super.overview,
    required super.backdropPath,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });
  // fromJason
  factory MovieDetailsModel.fromJason(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      runtime: json['runtime'],
      overview: json['overview'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      genres: List<GenresModel>.from(json['genres'].map(
        (x) => GenresModel.fromJason(x),
      )),
    );
  }
}

class GenresModel extends Genres {
  const GenresModel({
    required super.id,
    required super.name,
  });
  factory GenresModel.fromJason(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
