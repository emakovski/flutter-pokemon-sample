import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_test/features/pokedex/presentation/bloc/pokemons/pokemons_bloc.dart';
import 'package:pokedex_test/features/pokedex/presentation/widgets/loading_widget.dart';
import 'package:pokedex_test/features/pokedex/presentation/widgets/message_display.dart';
import 'package:pokedex_test/features/pokedex/presentation/widgets/pokemons_display.dart';

class PokemonsList extends StatelessWidget {
  const PokemonsList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PokemonsBloc>().add(const InitPokedex());

    return Expanded(
      child:
          BlocBuilder<PokemonsBloc, PokemonsState>(builder: (context, state) {
        if (state is Empty) {
          return const MessageDisplay(
            message: 'There aren\'t pokemons.',
          );
        } else if (state is Loading) {
          return const LoadingWidget();
        } else if (state is Loaded) {
          return PokemonsDisplay(pokemons: state.pokemons);
        } else if (state is Error) {
          return MessageDisplay(
            message: state.message,
          );
        }

        return Container();
      }),
    );
  }
}
