import 'package:equatable/equatable.dart';

class Actors extends Equatable {
  final int id;
  final String name;
  final String profilePath;
  final String character;
  const Actors({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });

  @override
  List<Object> get props => [
        id,
        name,
        profilePath,
        character,
      ];
}
