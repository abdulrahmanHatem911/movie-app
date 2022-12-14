import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failer.dart';
import '../entity/actors.dart';

import '../../../core/utills/base_use_case.dart';
import '../repository/base_movie_repository.dart';

class GetActorsMovieUseCase
    extends BaseUseCase<List<Actors>, ActorsParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetActorsMovieUseCase({
    required this.baseMovieRepository,
  });
  @override
  Future<Either<Failure, List<Actors>>> call(
      ActorsParameters parameters) async {
    return await baseMovieRepository.getActorsMovie(parameters);
  }
}

class ActorsParameters extends Equatable {
  final int? movieId;
  final int? actorId;

  const ActorsParameters({
    this.movieId,
    this.actorId,
  });
  @override
  List<Object?> get props => [
        movieId,
        actorId,
      ];
}
