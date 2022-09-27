import 'package:film/core/error/failer.dart';
import 'package:dartz/dartz.dart';
import 'package:film/core/utills/base_use_case.dart';
import 'package:film/movie/domain/entity/movie.dart';
import 'package:film/movie/domain/repository/base_movie_repository.dart';

class GetUpcomingMovieUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetUpcomingMovieUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getUpcomingMovies();
  }
}
