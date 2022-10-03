import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:film/core/error/failer.dart';
import 'package:film/core/utills/base_use_case.dart';
import 'package:film/movie/domain/entity/movie.dart';
import 'package:film/movie/domain/repository/base_movie_repository.dart';

class GetSearchMovieUseCase extends BaseUseCase<List<Movie>, SearchParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetSearchMovieUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(SearchParameters parameters) async {
    return await baseMovieRepository.getSearchMovie(parameters);
  }
}

class SearchParameters extends Equatable {
  final String query;
  SearchParameters(this.query);
  @override
  List<Object?> get props => [
        query,
      ];
}
