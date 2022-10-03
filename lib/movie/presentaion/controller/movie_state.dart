import 'package:equatable/equatable.dart';
import 'package:film/core/utills/enum.dart';

import '../../domain/entity/movie.dart';

class MovieState extends Equatable {
  final RequestState nowPlayingState;
  final String message;
  final List<Movie> nowPlayingMovies;
  // for popular movies
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> popularMovies;
  // for top rated movies
  final RequestState topRatedState;
  final String topRatedMessage;
  final List<Movie> topRatedMovies;
  // upcoming
  final RequestState upcomingState;
  final String upcomingMessage;
  final List<Movie> upcomingMovies;
  //search movies
  final RequestState searchState;
  final String searchMessage;
  final List<Movie> searchMovies;
  final int currantIndex;
  const MovieState({
    this.nowPlayingState = RequestState.loading,
    this.message = '',
    this.nowPlayingMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.popularMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
    this.topRatedMovies = const [],
    this.upcomingState = RequestState.loading,
    this.upcomingMessage = '',
    this.upcomingMovies = const [],
    this.currantIndex = 0,
    this.searchState = RequestState.loading,
    this.searchMessage = '',
    this.searchMovies = const [],
  });
  MovieState copyWith({
    RequestState? nowPlayingState,
    String? message,
    List<Movie>? nowPlayingMovies,
    // for popular movies
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? popularMovies,
    // for top rated movies
    RequestState? topRatedState,
    String? topRatedMessage,
    List<Movie>? topRatedMovies,
    //upcoming
    RequestState? upcomingState,
    String? upcomingMessage,
    List<Movie>? upcomingMovies,
    int? currantIndex,
    //search movies
    RequestState? searchState,
    String? searchMessage,
    List<Movie>? searchMovies,
  }) {
    return MovieState(
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      message: message ?? this.message,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingState: upcomingState ?? this.upcomingState,
      upcomingMessage: upcomingMessage ?? this.upcomingMessage,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      currantIndex: currantIndex ?? this.currantIndex,
      searchState: searchState ?? this.searchState,
      searchMessage: searchMessage ?? this.searchMessage,
      searchMovies: searchMovies ?? this.searchMovies,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingState,
        message,
        nowPlayingMovies,
        popularState,
        popularMessage,
        popularMovies,
        topRatedState,
        topRatedMessage,
        topRatedMovies,
        upcomingState,
        upcomingMessage,
        upcomingMovies,
        currantIndex,
        searchState,
        searchMessage,
        searchMovies,
      ];
}
