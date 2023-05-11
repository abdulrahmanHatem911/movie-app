import '../../domain/entity/movie_vedio.dart';

class MovieVideoModel extends MovieVideo {
  MovieVideoModel({
    required super.id,
    required super.key,
    required super.name,
    required super.site,
  });
  factory MovieVideoModel.fromJson(Map<String, dynamic> json) {
    return MovieVideoModel(
      id: json['id'] == null ? 0 : json['id'],
      key: json['key'] == null ? '' : json['key'],
      name: json['name'] == null ? '' : json['name'],
      site: json['site'] == null ? '' : json['site'],
    );
  }
}
