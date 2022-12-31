import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/utills/base_use_case.dart';
import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

import '../../../core/error/failer.dart';

class GetNowPlayingMovie extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetNowPlayingMovie(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getNewPlayingMovies();
  }
}
