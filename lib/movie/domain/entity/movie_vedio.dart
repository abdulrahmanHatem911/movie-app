import 'package:equatable/equatable.dart';

class MovieVideo extends Equatable {
  final String id;
  final String key;
  final String name;
  final String site;

  MovieVideo({
    required this.id,
    required this.key,
    required this.name,
    required this.site,
  });

  @override
  List<Object?> get props => [
        id,
        key,
        name,
        site,
      ];
}
