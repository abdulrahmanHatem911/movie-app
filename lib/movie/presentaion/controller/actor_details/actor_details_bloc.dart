import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utills/enum.dart';
import '../../../domain/entity/actor_details.dart';
import '../../../domain/useCase/get_actors_details_use_case.dart';

import '../../../domain/entity/movie.dart';
import '../../../domain/useCase/get_actor_movie_credits.dart';
import '../../../domain/useCase/get_actors_movie.dart';

part 'actor_details_event.dart';
part 'actor_details_state.dart';

class ActorDetailsBloc extends Bloc<ActorDetailsEvent, ActorDetailsState> {
  final GetActorDetailsUseCase getActorDetailsUseCase;
  final GetActorMovieCreditsUseCase getActorMovieCreditsUseCase;
  ActorDetailsBloc(
    this.getActorDetailsUseCase,
    this.getActorMovieCreditsUseCase,
  ) : super(const ActorDetailsState()) {
    on<GetActorDetailsEvent>(_getActorDetails);
    on<GetActorMoviesCreditsEvent>(_getActorMoviesCredits);
  }

  FutureOr<void> _getActorDetails(
      GetActorDetailsEvent event, Emitter<ActorDetailsState> emit) async {
    final _result = await getActorDetailsUseCase.call(
      ActorsParameters(actorId: event.actorId),
    );
    _result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          requestState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          requestState: RequestState.loaded,
          actorDetails: r,
        ),
      ),
    );
  }

  FutureOr<void> _getActorMoviesCredits(
      GetActorMoviesCreditsEvent event, Emitter<ActorDetailsState> emit) async {
    final _result = await getActorMovieCreditsUseCase.call(
      ActorsParameters(actorId: event.actorId),
    );
    _result.fold(
      (l) => emit(
        state.copyWith(
          actorMoviesMessage: l.message,
          actorMoviesRequestState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          actorMoviesRequestState: RequestState.loaded,
          actorMoviesCredits: r,
        ),
      ),
    );
  }
}
