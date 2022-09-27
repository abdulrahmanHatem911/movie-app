import 'dart:async';

import 'package:dio/dio.dart';
import 'package:film/core/utills/base_use_case.dart';
import 'package:film/core/utills/contant.dart';
import 'package:film/movie/data/models/movie_model.dart';
import 'package:film/movie/domain/useCase/get_upcoming_movie.dart';
import 'package:film/movie/domain/useCase/movie_details_use_case.dart';
import 'package:film/movie/presentaion/controller/moice_event.dart';
import 'package:film/movie/presentaion/controller/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utills/enum.dart';
import '../../domain/entity/movie.dart';
import '../../domain/useCase/get_now_playing_movie.dart';
import '../../domain/useCase/get_popular_movie.dart';
import '../../domain/useCase/get_toprated_movie.dart';
import '../screens/movies_screen.dart';

class MovieBloc extends Bloc<MoviesEvent, MovieState> {
  final GetNowPlayingMovie getNowPlayingMovie;
  final GetPopularMovie getPopularMovie;
  final GetTopRatedMovie getTopRatedMovie;
  final GetUpcomingMovieUseCase getUpcomingMovieUseCase;
  List<Movie> getRefreshPopularList = [];
  int refreshPopularMoviePage = 1;
  List<Movie> getRefreshTopRatedList = [];
  int refreshTopRatedMoviePage = 1;
  int index = 0;
  MovieBloc(
    this.getNowPlayingMovie,
    this.getPopularMovie,
    this.getTopRatedMovie,
    this.getUpcomingMovieUseCase,
  ) : super(const MovieState()) {
    on<GetNewPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    on<GetUpcomingMoviesEvent>(_getUpcomingMovie);
    on<ChangePageEvent>(_changePage);
  }

  FutureOr<void> _getNowPlayingMovies(
    GetNewPlayingMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    final result = await getNowPlayingMovie.call(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingState: RequestState.error,
        message: l.message,
      )),
      (r) => emit(
        state.copyWith(
            nowPlayingState: RequestState.loaded, nowPlayingMovies: r),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    final result = await getPopularMovie
        .call(MovieDetailsParameters(page: refreshPopularMoviePage++));

    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )), (r) {
      getRefreshPopularList = getRefreshPopularList + r;

      emit(
        state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: getRefreshPopularList,
        ),
      );
    });
  }

//
  FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    final result = await getTopRatedMovie.call(
      MovieDetailsParameters(page: refreshTopRatedMoviePage++),
    );
    result.fold(
      (l) => emit(state.copyWith(
        topRatedState: RequestState.error,
        topRatedMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(topRatedState: RequestState.loaded, topRatedMovies: r),
      ),
    );
  }

  FutureOr<void> _getUpcomingMovie(
      GetUpcomingMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getUpcomingMovieUseCase.call(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          upcomingState: RequestState.error,
          upcomingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          upcomingState: RequestState.loaded,
          upcomingMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _changePage(ChangePageEvent event, Emitter<MovieState> emit) {
    index = event.currentPage;
    emit(
      state.copyWith(
        currantIndex: index,
      ),
    );
  }
}
