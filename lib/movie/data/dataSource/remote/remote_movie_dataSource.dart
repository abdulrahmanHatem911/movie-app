import 'package:dio/dio.dart';

import '../../../../core/error/exeption.dart';
import '../../../../core/network/error_model.dart';
import '../../../../core/utills/api_keys.dart';
import '../../../domain/entity/actor_details.dart';
import '../../../domain/entity/actors.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/entity/movie_details.dart';
import '../../../domain/entity/movie_vedio.dart';
import '../../../domain/entity/recommendations_movie.dart';
import '../../../domain/useCase/get_actors_movie.dart';
import '../../../domain/useCase/get_recommendations_movie.dart';
import '../../../domain/useCase/get_search_movie_use_case.dart';
import '../../../domain/useCase/movie_details_use_case.dart';
import '../../models/actore_detailes.dart';
import '../../models/actors_model.dart';
import '../../models/movie_details_model.dart';
import '../../models/movie_model.dart';
import '../../models/movie_video_model.dart';
import '../../models/recommendation_model.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<Movie>> getNowPlayingMovie();
  Future<List<Movie>> getPopularMovies(MovieDetailsParameters parameters);
  Future<List<Movie>> getTopRatedMovies(MovieDetailsParameters parameters);
  Future<List<Movie>> getUpcomingMovies();
  Future<MovieDetails> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<Recommendations>> getRecommendationsMovie(
      RecommendationParameters parameters);
  Future<List<Actors>> getActorsMovie(ActorsParameters parameters);
  Future<ActorDetails> getActorDetails(ActorsParameters parameters);
  Future<List<Movie>> getActorMovieCredits(ActorsParameters parameters);
  Future<List<Movie>> getSearchMovie(SearchParameters parameters);
  Future<List<MovieVideo>> getMovieVideos(MovieDetailsParameters parameters);
}

class RemoteMovieDataSource extends BaseRemoteMovieDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(AppConstant.getNowPlayingMove);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> getPopularMovies(
    MovieDetailsParameters parameters,
  ) async {
    final response =
        await Dio().get(AppConstant.getRefreshPopularMovie(parameters.page!));
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> getTopRatedMovies(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(AppConstant.getTopRatedMovies(parameters.page!));
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response = await Dio().get(
      AppConstant.movieDetailsPath(parameters.movieId!),
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJason(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendations>> getRecommendationsMovie(
    RecommendationParameters parameters,
  ) async {
    final response =
        await Dio().get(AppConstant.recommendationsMoviePath(parameters.id));
    if (response.statusCode == 200) {
      return List<Recommendations>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJason(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    final response = await Dio().get(AppConstant.getUpcomingMovie);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<Actors>> getActorsMovie(ActorsParameters parameters) async {
    final response =
        await Dio().get(AppConstant.getMovieCastPath(parameters.movieId!));
    if (response.statusCode == 200) {
      return List<ActorsModel>.from(
        (response.data['cast'] as List).map(
          (e) => ActorsModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ActorDetails> getActorDetails(ActorsParameters parameters) async {
    final response =
        await Dio().get(AppConstant.getActorDetailsPath(parameters.actorId!));
    if (response.statusCode == 200) {
      return ActorDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<Movie>> getActorMovieCredits(ActorsParameters parameters) async {
    final _response = await Dio()
        .get(AppConstant.getActorMovieCreditsPath(parameters.actorId!));
    if (_response.statusCode == 200) {
      return List<MovieModel>.from(((_response.data['cast'] as List)
          .map((e) => MovieModel.fromJson(e))));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(_response.data),
      );
    }
  }

  @override
  Future<List<Movie>> getSearchMovie(SearchParameters parameters) async {
    final response =
        await Dio().get(AppConstant.getSearchMoviePath(parameters.query));
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieVideo>> getMovieVideos(
      MovieDetailsParameters parameters) async {
    final response = await Dio()
        .get(AppConstant.getMovieVideoPath(parameters.movieId ?? 760161));
    if (response.statusCode == 200) {
      return List<MovieVideoModel>.from((response.data['results'] as List)
          .map((e) => MovieVideoModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
