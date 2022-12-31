import 'package:dartz/dartz.dart';
import '../../../core/error/exeption.dart';
import '../../../core/error/failer.dart';
import '../dataSource/remote/remote_movie_dataSource.dart';
import '../../domain/entity/actor_details.dart';
import '../../domain/entity/actors.dart';
import '../../domain/entity/movie.dart';
import '../../domain/entity/movie_details.dart';
import '../../domain/entity/movie_vedio.dart';
import '../../domain/entity/recommendations_movie.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../../domain/useCase/get_actors_movie.dart';
import '../../domain/useCase/get_recommendations_movie.dart';
import '../../domain/useCase/get_search_movie_use_case.dart';
import '../../domain/useCase/movie_details_use_case.dart';

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

  @override
  Future<Either<Failure, List<MovieVideo>>> getMovieVideo(
      MovieDetailsParameters parameters) async {
    final result = await baseRemoteMovieDataSource.getMovieVideos(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
