import '../../domain/entity/actors.dart';

class ActorsModel extends Actors {
  ActorsModel(
      {required super.id,
      required super.name,
      required super.profilePath,
      required super.character});
  factory ActorsModel.fromJson(Map<String, dynamic> json) {
    return ActorsModel(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'],
      character: json['character'],
    );
  }
}
