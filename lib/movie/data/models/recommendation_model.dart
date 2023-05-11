import '../../domain/entity/recommendations_movie.dart';

class RecommendationModel extends Recommendations {
  const RecommendationModel({super.backdropPath, required super.id});
  factory RecommendationModel.fromJason(Map<String, dynamic> json) {
    return RecommendationModel(
      backdropPath: json['backdrop_path'] == null
          ? "/wPLXqJMbGH5F4ralorSiRQJwDp3.jpg"
          : json['backdrop_path'],
      id: json['id'] == null ? 0 : json['id'],
    );
  }
}
