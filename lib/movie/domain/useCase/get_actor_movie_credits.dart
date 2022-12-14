import '../../../core/error/failer.dart';
import 'package:dartz/dartz.dart';
import '../../../core/utills/base_use_case.dart';
import 'get_actors_movie.dart';

import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class GetActorMovieCreditsUseCase
    extends BaseUseCase<List<Movie>, ActorsParameters> {
  final BaseMovieRepository repository;
  GetActorMovieCreditsUseCase(this.repository);
  @override
  Future<Either<Failure, List<Movie>>> call(ActorsParameters parameters) async {
    return await repository.getActorsMovieCredits(parameters);
  }
}
