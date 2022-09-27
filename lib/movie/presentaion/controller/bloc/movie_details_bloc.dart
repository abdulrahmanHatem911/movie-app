import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:film/core/utills/enum.dart';
import 'package:film/movie/domain/entity/actors.dart';
import 'package:film/movie/domain/entity/movie_details.dart';
import 'package:film/movie/domain/entity/recommendations_movie.dart';
import 'package:film/movie/domain/useCase/get_actors_movie.dart';
import 'package:film/movie/domain/useCase/get_recommendations_movie.dart';
import 'package:film/movie/domain/useCase/movie_details_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  // call use cae
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMovie getRecommendationMovie;
  final GetActorsMovieUseCase getActorsMovieUseCase;
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationMovie,
    this.getActorsMovieUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendations);
    on<GetActorsMovieEvent>(_getActors);
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
}
