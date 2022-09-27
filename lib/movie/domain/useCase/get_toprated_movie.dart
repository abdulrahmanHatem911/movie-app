import 'package:dartz/dartz.dart';
import 'package:film/core/utills/base_use_case.dart';
import 'package:film/movie/domain/entity/movie.dart';
import 'package:film/movie/domain/repository/base_movie_repository.dart';
import 'package:film/movie/domain/useCase/movie_details_use_case.dart';

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
