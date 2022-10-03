import 'package:dartz/dartz.dart';
import 'package:film/movie/domain/entity/actor_details.dart';
import 'package:film/movie/domain/entity/actors.dart';
import 'package:film/movie/domain/entity/movie.dart';
import 'package:film/movie/domain/entity/recommendations_movie.dart';
import 'package:film/movie/domain/useCase/movie_details_use_case.dart';

import '../../../core/error/failer.dart';
import '../entity/movie_details.dart';
import '../useCase/get_actors_movie.dart';
import '../useCase/get_recommendations_movie.dart';
import '../useCase/get_search_movie_use_case.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNewPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies(
    MovieDetailsParameters parameters,
  );
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(
    MovieDetailsParameters parameters,
  );
  Future<Either<Failure, List<Movie>>> getUpcomingMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(
    MovieDetailsParameters parameters,
  );
  //
  Future<Either<Failure, List<Recommendations>>> getRecommendationsMovies(
      RecommendationParameters parameters);
  Future<Either<Failure, List<Actors>>> getActorsMovie(
    ActorsParameters parameters,
  );
  Future<Either<Failure, ActorDetails>> getActorsMovieDetails(
    ActorsParameters parameters,
  );
  Future<Either<Failure, List<Movie>>> getActorsMovieCredits(
    ActorsParameters parameters,
  );
  Future<Either<Failure, List<Movie>>> getSearchMovie(
    SearchParameters parameters,
  );
}
