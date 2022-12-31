import 'package:dartz/dartz.dart';
import '../../../core/utills/base_use_case.dart';

import '../../../core/error/failer.dart';
import '../entity/movie_vedio.dart';
import '../repository/base_movie_repository.dart';
import 'movie_details_use_case.dart';

class GetMovieVideoUseCase
    extends BaseUseCase<List<MovieVideo>, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieVideoUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<MovieVideo>>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieVideo(parameters);
  }
}
