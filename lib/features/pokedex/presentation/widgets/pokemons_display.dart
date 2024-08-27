import 'package:flutter/material.dart';
import 'package:pokedex_test/features/pokedex/data/models/pokemon_short_model.dart';
import 'package:pokedex_test/features/pokedex/presentation/widgets/pokemon_short_card.dart';

class PokemonsDisplay extends StatelessWidget {
  final List<PokemonShortModel> pokemons;
  const PokemonsDisplay({super.key, required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 20),
        itemCount: pokemons.length,
        itemBuilder: (context, index) =>
            PokemonShortCard(pokemon: pokemons[index]),
      ),
    );
  }
}
