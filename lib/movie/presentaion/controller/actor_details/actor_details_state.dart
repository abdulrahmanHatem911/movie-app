part of 'actor_details_bloc.dart';

class ActorDetailsState extends Equatable {
  final ActorDetails? actorDetails;
  final RequestState requestState;
  final String message;
  final List<Movie> actorMoviesCredits;
  final RequestState actorMoviesRequestState;
  final String actorMoviesMessage;
  const ActorDetailsState({
    this.actorDetails,
    this.requestState = RequestState.loading,
    this.message = '',
    this.actorMoviesCredits = const [],
    this.actorMoviesRequestState = RequestState.loading,
    this.actorMoviesMessage = '',
  });
  ActorDetailsState copyWith({
    ActorDetails? actorDetails,
    RequestState? requestState,
    String? message,
    List<Movie>? actorMoviesCredits,
    RequestState? actorMoviesRequestState,
    String? actorMoviesMessage,
  }) {
    return ActorDetailsState(
      actorDetails: actorDetails ?? this.actorDetails,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
      actorMoviesCredits: actorMoviesCredits ?? this.actorMoviesCredits,
      actorMoviesRequestState:
          actorMoviesRequestState ?? this.actorMoviesRequestState,
      actorMoviesMessage: actorMoviesMessage ?? this.actorMoviesMessage,
    );
  }

  @override
  List<Object?> get props => [
        actorDetails,
        requestState,
        message,
        actorMoviesCredits,
        actorMoviesRequestState,
        actorMoviesMessage,
      ];
}
