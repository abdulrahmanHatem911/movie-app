import 'package:dartz/dartz.dart';
import '../../../core/utills/base_use_case.dart';
import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';
import 'movie_details_use_case.dart';

import '../../../core/error/failer.dart';

class GetTopRatedMovie
    extends BaseUseCase<List<Movie>, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetTopRatedMovie(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getTopRatedMovies(parameters);
  }
}
