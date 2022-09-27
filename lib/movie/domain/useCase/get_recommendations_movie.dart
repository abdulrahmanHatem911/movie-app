import 'package:equatable/equatable.dart';
import 'package:film/core/error/failer.dart';
import 'package:dartz/dartz.dart';
import 'package:film/core/utills/base_use_case.dart';
import 'package:film/movie/domain/entity/recommendations_movie.dart';
import 'package:film/movie/domain/repository/base_movie_repository.dart';

class GetRecommendationMovie
    extends BaseUseCase<List<Recommendations>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetRecommendationMovie(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Recommendations>>> call(
      RecommendationParameters parameters) async {
    return await baseMovieRepository.getRecommendationsMovies(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;
  const RecommendationParameters({required this.id});

  @override
  List<Object?> get props => [id];
}
