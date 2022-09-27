import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final int id;
  final int runtime;
  final String overview;
  final String backdropPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final List<Genres> genres;
  const MovieDetails({
    required this.id,
    required this.runtime,
    required this.overview,
    required this.backdropPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object> get props => [
        id,
        runtime,
        overview,
        backdropPath,
        releaseDate,
        title,
        voteAverage,
        genres,
      ];
}

class Genres extends Equatable {
  final int id;
  final String name;
  const Genres({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
