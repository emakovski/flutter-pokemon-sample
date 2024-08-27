
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_test/core/error/failures.dart';
import 'package:pokedex_test/core/global/global_variables.dart';
import 'package:pokedex_test/features/pokedex/data/models/pokemon_short_model.dart';
import 'package:pokedex_test/features/pokedex/domain/usecases/get_pokemons.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

const String serverFailureMessage = 'Server Failure';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final GetPokemons getPokemons;

  PokemonsBloc({
    required this.getPokemons,
  }) : super(Empty()) {
    on<InitPokedex>((event, emit) async {
      int currentOffset = 0;
      emit(Loading(offset: currentOffset));
      final failureOrPosts = await getPokemons(Params(offset: currentOffset));
      emit(failureOrPosts.fold(
        (failure) => Error(
          message: _mapFailureToMessage(failure),
        ),
        (pokemons) => Loaded(
            pokemons: pokemons as List<PokemonShortModel>,
            offset: currentOffset),
      ));
    });

    on<NextPage>((event, emit) async {
      if (state.offset > GlobalVariables.maxPokemons) return;
      int currentOffset = state.offset + 10;
      emit(Loading(offset: currentOffset));
      final failureOrPosts = await getPokemons(Params(offset: currentOffset));
      emit(failureOrPosts.fold(
        (failure) => Error(
          message: _mapFailureToMessage(failure),
        ),
        (pokemons) => Loaded(
            pokemons: pokemons as List<PokemonShortModel>,
            offset: currentOffset),
      ));
    });

    on<PreviousPage>((event, emit) async {
      if (state.offset <= 0) return;
      int currentOffset = state.offset - 10;

      emit(Loading(offset: currentOffset));
      final failureOrPosts = await getPokemons(Params(offset: currentOffset));
      emit(failureOrPosts.fold(
        (failure) => Error(
          message: _mapFailureToMessage(failure),
        ),
        (pokemons) => Loaded(
            pokemons: pokemons as List<PokemonShortModel>,
            offset: currentOffset),
      ));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure.runtimeType is ServerFailure) {
      return serverFailureMessage;
    } else {
      return 'Unexpected Error';
    }
  }
}
