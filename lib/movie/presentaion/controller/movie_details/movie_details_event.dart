part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;
  const GetMovieDetailsEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final int id;
  const GetMovieRecommendationEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetActorsMovieEvent extends MovieDetailsEvent {
  final int id;
  const GetActorsMovieEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetMovieVideosEvent extends MovieDetailsEvent {
  final int id;
  const GetMovieVideosEvent(this.id);
  @override
  List<Object> get props => [id];
}
