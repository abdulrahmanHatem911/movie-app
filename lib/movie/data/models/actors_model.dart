import '../../domain/entity/actors.dart';

class ActorsModel extends Actors {
  ActorsModel(
      {required super.id,
      required super.name,
      required super.profilePath,
      required super.character});
  factory ActorsModel.fromJson(Map<String, dynamic> json) {
    return ActorsModel(
      id: json['id'] == null ? 0 : json['id'],
      name: json['name'] == null ? '' : json['name'],
      profilePath: json['profile_path'] == null
          ? '/5M7oN3sznp99hWYQ9sX0xheswWX.jpg'
          : json['profile_path'],
      character: json['character'] == null ? '' : json['character'],
    );
  }
}
