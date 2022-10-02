part of 'actor_details_bloc.dart';

abstract class ActorDetailsEvent extends Equatable {
  const ActorDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetActorDetailsEvent extends ActorDetailsEvent {
  final int actorId;
  GetActorDetailsEvent(this.actorId);
  @override
  List<Object> get props => [actorId];
}

class GetActorMoviesCreditsEvent extends ActorDetailsEvent {
  final int actorId;
  GetActorMoviesCreditsEvent(this.actorId);
  @override
  List<Object> get props => [actorId];
}
