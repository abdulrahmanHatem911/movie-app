part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  //
  final List<Recommendations> recommendations;
  final RequestState recommendationsState;
  final String recommendationsMessage;
  //
  final List<Actors> actorsList;
  final RequestState actorsState;
  final String actorsMessage;
  //
  final List<MovieVideo> videosList;
  final RequestState videosState;
  final String videosMessage;
  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendations = const [],
    this.recommendationsMessage = '',
    this.recommendationsState = RequestState.loading,
    this.actorsList = const [],
    this.actorsState = RequestState.loading,
    this.actorsMessage = '',
    this.videosList = const [],
    this.videosState = RequestState.loading,
    this.videosMessage = '',
  });
  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendations>? recommendations,
    RequestState? recommendationsState,
    String? recommendationsMessage,
    List<Actors>? actorsList,
    RequestState? actorsState,
    String? actorsMessage,
    List<MovieVideo>? videosList,
    RequestState? videosState,
    String? videosMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationsState: recommendationsState ?? this.recommendationsState,
      recommendationsMessage:
          recommendationsMessage ?? this.recommendationsMessage,
      actorsList: actorsList ?? this.actorsList,
      actorsState: actorsState ?? this.actorsState,
      actorsMessage: actorsMessage ?? this.actorsMessage,
      videosList: videosList ?? this.videosList,
      videosState: videosState ?? this.videosState,
      videosMessage: videosMessage ?? this.videosMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendations,
        recommendationsState,
        recommendationsMessage,
        actorsList,
        actorsState,
        actorsMessage,
        videosList,
        videosState,
        videosMessage,
      ];
}
