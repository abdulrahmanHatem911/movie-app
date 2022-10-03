import 'package:dartz/dartz.dart';
import 'package:film/core/error/exeption.dart';
import 'package:film/core/error/failer.dart';
import 'package:film/movie/data/dataSource/remote/remote_movie_dataSource.dart';
import 'package:film/movie/domain/entity/actor_details.dart';
import 'package:film/movie/domain/entity/actors.dart';
import 'package:film/movie/domain/entity/movie.dart';
import 'package:film/movie/domain/entity/movie_details.dart';
import 'package:film/movie/domain/entity/recommendations_movie.dart';
import 'package:film/movie/domain/repository/base_movie_repository.dart';
import 'package:film/movie/domain/useCase/get_actors_movie.dart';
import 'package:film/movie/domain/useCase/get_recommendations_movie.dart';
import 'package:film/movie/domain/useCase/get_search_movie_use_case.dart';
import 'package:film/movie/domain/useCase/movie_details_use_case.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseRemoteMovieDataSource baseRemoteMovieDataSource;
  MovieRepository({
    required this.baseRemoteMovieDataSource,
  });
  @override
  Future<Either<Failure, List<Movie>>> getNewPlayingMovies() async {
    final result = await baseRemoteMovieDataSource.getNowPlayingMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
        ServerFailure(
          message: failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies(
      MovieDetailsParameters parameters) async {
    final result = await baseRemoteMovieDataSource.getPopularMovies(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(
      MovieDetailsParameters parameters) async {
    final result =
        await baseRemoteMovieDataSource.getTopRatedMovies(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseRemoteMovieDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendationsMovies(
      RecommendationParameters parameters) async {
    final result =
        await baseRemoteMovieDataSource.getRecommendationsMovie(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies() async {
    final result = await baseRemoteMovieDataSource.getUpcomingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Actors>>> getActorsMovie(
      ActorsParameters parameters) async {
    final result = await baseRemoteMovieDataSource.getActorsMovie(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ActorDetails>> getActorsMovieDetails(
      ActorsParameters parameters) async {
    final result = await baseRemoteMovieDataSource.getActorDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getActorsMovieCredits(
      ActorsParameters parameters) async {
    final result =
        await baseRemoteMovieDataSource.getActorMovieCredits(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getSearchMovie(
      SearchParameters parameters) async {
    final result = await baseRemoteMovieDataSource.getSearchMovie(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
