import '../../../core/error/failer.dart';
import 'package:dartz/dartz.dart';
import '../../../core/utills/base_use_case.dart';
import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class GetUpcomingMovieUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetUpcomingMovieUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getUpcomingMovies();
  }
}
