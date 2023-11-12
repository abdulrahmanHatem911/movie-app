import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utills/base_use_case.dart';
import '../../../core/utills/enum.dart';
import '../../domain/entity/movie.dart';
import '../../domain/useCase/get_now_playing_movie.dart';
import '../../domain/useCase/get_popular_movie.dart';
import '../../domain/useCase/get_search_movie_use_case.dart';
import '../../domain/useCase/get_toprated_movie.dart';
import '../../domain/useCase/get_upcoming_movie.dart';
import '../../domain/useCase/movie_details_use_case.dart';
import 'moice_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MoviesEvent, MovieState> {
  final GetNowPlayingMovie getNowPlayingMovie;
  final GetPopularMovie getPopularMovie;
  final GetTopRatedMovie getTopRatedMovie;
  final GetUpcomingMovieUseCase getUpcomingMovieUseCase;
  final GetSearchMovieUseCase getSearchMovieUseCase;
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
    this.getSearchMovieUseCase,
  ) : super(const MovieState()) {
    on<GetNewPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    on<GetUpcomingMoviesEvent>(_getUpcomingMovie);
    on<ChangePageEvent>(_changePage);
    on<GetSearchMovieEvent>(_getSearchMovie);
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

  FutureOr<void> _getSearchMovie(
      GetSearchMovieEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(searchState: RequestState.loading));
    final _result =
        await getSearchMovieUseCase.call(SearchParameters(event.query));
    _result.fold(
        (l) => emit(state.copyWith(
              searchState: RequestState.error,
              searchMessage: l.message,
            )), (r) {
      emit(
        state.copyWith(
          searchState: RequestState.loaded,
          searchMovies: r,
        ),
      );
    });
  }
}
