import 'package:film/movie/data/dataSource/remote/remote_movie_dataSource.dart';
import 'package:film/movie/data/repository/movie_repository.dart';
import 'package:film/movie/domain/repository/base_movie_repository.dart';
import 'package:film/movie/domain/useCase/get_actor_movie_credits.dart';
import 'package:film/movie/domain/useCase/get_actors_movie.dart';
import 'package:film/movie/domain/useCase/get_popular_movie.dart';
import 'package:film/movie/domain/useCase/get_recommendations_movie.dart';
import 'package:film/movie/domain/useCase/get_toprated_movie.dart';
import 'package:film/movie/domain/useCase/get_upcoming_movie.dart';
import 'package:film/movie/domain/useCase/movie_details_use_case.dart';
import 'package:film/movie/presentaion/controller/actor_details/actor_details_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../movie/domain/useCase/get_actors_details_use_case.dart';
import '../../movie/domain/useCase/get_now_playing_movie.dart';
import '../../movie/presentaion/controller/movie_bloc.dart';
import '../../movie/presentaion/controller/movie_details/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // to bloc
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl(), sl()));
    sl.registerFactory(() => ActorDetailsBloc(sl(), sl()));
    // use case
    sl.registerLazySingleton(() => GetNowPlayingMovie(sl()));
    sl.registerLazySingleton(() => GetPopularMovie(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovie(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationMovie(sl()));
    sl.registerLazySingleton(() => GetUpcomingMovieUseCase(sl()));
    sl.registerLazySingleton(
        () => GetActorsMovieUseCase(baseMovieRepository: sl()));
    sl.registerLazySingleton(() => GetActorDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetActorMovieCreditsUseCase(sl()));
    // repository
    sl.registerLazySingleton<BaseMovieRepository>(
      () => MovieRepository(baseRemoteMovieDataSource: sl()),
    );

    ///DataSources
    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
      () => RemoteMovieDataSource(),
    );
  }
}
