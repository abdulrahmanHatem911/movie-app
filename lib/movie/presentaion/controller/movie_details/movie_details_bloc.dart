import 'dart:async';

import 'package:equatable/equatable.dart';
import '../../../../core/utills/enum.dart';
import '../../../domain/entity/actors.dart';
import '../../../domain/entity/movie_details.dart';
import '../../../domain/entity/movie_vedio.dart';
import '../../../domain/entity/recommendations_movie.dart';
import '../../../domain/useCase/get_actors_movie.dart';
import '../../../domain/useCase/get_movie_video.use_case.dart';
import '../../../domain/useCase/get_recommendations_movie.dart';
import '../../../domain/useCase/movie_details_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  // call use cae
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMovie getRecommendationMovie;
  final GetActorsMovieUseCase getActorsMovieUseCase;
  final GetMovieVideoUseCase getMovieVideoUseCase;
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationMovie,
    this.getActorsMovieUseCase,
    this.getMovieVideoUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendations);
    on<GetActorsMovieEvent>(_getActors);
    on<GetMovieVideosEvent>(_getMovieVideo);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase
        .call(MovieDetailsParameters(movieId: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsMessage: l.message,
          movieDetailsState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetailsState: RequestState.loaded,
          movieDetails: r,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendations(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationMovie.call(
      RecommendationParameters(id: event.id),
    );
    result.fold(
      (l) => emit(state.copyWith(
        recommendationsState: RequestState.error,
        recommendationsMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          recommendationsState: RequestState.loaded,
          recommendations: r,
        ),
      ),
    );
  }

  FutureOr<void> _getActors(
      GetActorsMovieEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getActorsMovieUseCase.call(ActorsParameters(movieId: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        actorsState: RequestState.error,
        actorsMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          actorsState: RequestState.loaded,
          actorsList: r,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieVideo(
      GetMovieVideosEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieVideoUseCase
        .call(MovieDetailsParameters(movieId: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        videosState: RequestState.error,
        videosMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          videosState: RequestState.loaded,
          videosList: r,
        ),
      ),
    );
  }
}
