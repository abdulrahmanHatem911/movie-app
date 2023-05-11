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
      id: json['id'] == null ? 0 : json['id'],
      title: json['title'] == null ? '' : json['title'],
      backdropPath: json['backdrop_path'] == null
          ? '/4GWYk5VP9qu1rNSeNAwNaBy9mwS.jpg'
          : json['backdrop_path'],
      posterPath: json['poster_path'] == null
          ? '/5M7oN3sznp99hWYQ9sX0xheswWX.jpg'
          : json['poster_path'],
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)) == null
          ? []
          : List<int>.from(json['genre_ids'].map((x) => x)),
      overview: json['overview'] == null ? '' : json['overview'],
      voteAverage: json['vote_average'].toDouble() == null
          ? 0.0
          : json['vote_average'].toDouble(),
      releaseDate: json['release_date'] == null ? '' : json['release_date'],
    );
  }
}
