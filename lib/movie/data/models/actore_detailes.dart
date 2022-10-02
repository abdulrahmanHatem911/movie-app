import 'package:film/movie/domain/entity/actor_details.dart';

class ActorDetailsModel extends ActorDetails {
  ActorDetailsModel({
    required super.id,
    required super.name,
    required super.profilePath,
    required super.character,
    required super.birthday,
    required super.placeOfBirth,
    required super.biography,
  });
  factory ActorDetailsModel.fromJson(Map<String, dynamic> json) {
    return ActorDetailsModel(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'],
      character: json['known_for_department'],
      birthday: json['birthday'],
      placeOfBirth: json['place_of_birth'],
      biography: json['biography'],
    );
  }
}
