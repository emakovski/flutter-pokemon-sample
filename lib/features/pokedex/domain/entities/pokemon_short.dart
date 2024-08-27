import 'package:equatable/equatable.dart';

class PokemonShort extends Equatable {
  final String name;
  final String url;

  const PokemonShort({required this.name, required this.url});

  @override
  List<Object?> get props => [[name, url]];
}
