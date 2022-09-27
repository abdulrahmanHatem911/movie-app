import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
  @override
  List<Object> get props => [];
}

class GetNewPlayingMoviesEvent extends MoviesEvent {}

class GetPopularMoviesEvent extends MoviesEvent {}

class GetTopRatedMoviesEvent extends MoviesEvent {}

class GetUpcomingMoviesEvent extends MoviesEvent {}

class ChangePageEvent extends MoviesEvent {
  final int currentPage;
  const ChangePageEvent({required this.currentPage});
  @override
  List<Object> get props => [currentPage];
}
