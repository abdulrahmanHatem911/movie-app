import '../../domain/entity/actor_details.dart';

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
      id: json['id'] == null ? 0 : json['id'],
      name: json['name'] == null ? '' : json['name'],
      profilePath: json['profile_path'] == null
          ? '/5M7oN3sznp99hWYQ9sX0xheswWX.jpg'
          : json['profile_path'],
      character: json['known_for_department'] == null
          ? ''
          : json['known_for_department'],
      birthday: json['birthday'] == null ? '' : json['birthday'],
      placeOfBirth:
          json['place_of_birth'] == null ? '' : json['place_of_birth'],
      biography: json['biography'] == null ? '' : json['biography'],
    );
  }
}
