part of 'pokemons_bloc.dart';

abstract class PokemonsState extends Equatable {
  final int offset;
  final List<PokemonShortModel> pokemons;
  const PokemonsState({
    this.offset = 0,
    this.pokemons = const [],
  });

  @override
  List<Object> get props => [];
}

class Empty extends PokemonsState {}

class Loading extends PokemonsState {

  const Loading({super.offset});

  @override
  List<Object> get props => [pokemons, offset];
}

class Loaded extends PokemonsState {

  const Loaded({super.pokemons, super.offset});

  @override
  List<Object> get props => [pokemons, offset];
}

class Error extends PokemonsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
