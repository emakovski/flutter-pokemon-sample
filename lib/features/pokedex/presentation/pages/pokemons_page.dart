import 'package:flutter/material.dart';
import 'package:pokedex_test/features/pokedex/presentation/widgets/header_pokemons.dart';
import 'package:pokedex_test/features/pokedex/presentation/widgets/pokemons_list.dart';

class PokemonsPage extends StatelessWidget {
  static const route = 'pokemons';

  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFC13733),
        body: SafeArea(
      child: PokemonsBody(),
    ));
  }
}

class PokemonsBody extends StatelessWidget {
  const PokemonsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeaderPokemons(),
        PokemonsList(),
      ],
    );
  }
}
