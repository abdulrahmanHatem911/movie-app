import '../../../core/error/failer.dart';
import 'package:dartz/dartz.dart';
import '../../../core/utills/base_use_case.dart';
import '../entity/actor_details.dart';
import '../repository/base_movie_repository.dart';
import 'get_actors_movie.dart';

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
