import 'package:equatable/equatable.dart';
import '../../../core/error/failer.dart';
import 'package:dartz/dartz.dart';
import '../../../core/utills/base_use_case.dart';
import '../entity/movie_details.dart';
import '../repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(
    MovieDetailsParameters parameters,
  ) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int? movieId;
  final int? page;
  const MovieDetailsParameters({
    this.movieId,
    this.page,
  });
  @override
  List<Object?> get props => [
        movieId,
        page,
      ];
}
