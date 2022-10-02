import 'package:equatable/equatable.dart';

class ActorDetails extends Equatable {
  final int id;
  final String name;
  final String profilePath;
  final String character;
  final String birthday;
  final String placeOfBirth;
  final String biography;
  const ActorDetails({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
    required this.birthday,
    required this.placeOfBirth,
    required this.biography,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        profilePath,
        character,
        birthday,
        placeOfBirth,
        biography,
      ];
}
