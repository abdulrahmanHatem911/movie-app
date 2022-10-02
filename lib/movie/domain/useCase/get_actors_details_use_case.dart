import 'package:film/core/error/failer.dart';
import 'package:dartz/dartz.dart';
import 'package:film/core/utills/base_use_case.dart';
import 'package:film/movie/domain/entity/actor_details.dart';
import 'package:film/movie/domain/repository/base_movie_repository.dart';
import 'package:film/movie/domain/useCase/get_actors_movie.dart';

class GetActorDetailsUseCase
    extends BaseUseCase<ActorDetails, ActorsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetActorDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, ActorDetails>> call(
      ActorsParameters parameters) async {
    return await baseMovieRepository.getActorsMovieDetails(parameters);
  }
}
