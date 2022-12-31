import 'package:dartz/dartz.dart';
import '../../../core/utills/base_use_case.dart';
import '../entity/movie.dart';
import 'movie_details_use_case.dart';

import '../../../core/error/failer.dart';
import '../repository/base_movie_repository.dart';

class GetPopularMovie extends BaseUseCase<List<Movie>, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetPopularMovie(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getPopularMovies(parameters);
  }
}
