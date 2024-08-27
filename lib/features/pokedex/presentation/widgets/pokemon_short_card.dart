import 'package:flutter/material.dart';
import 'package:pokedex_test/core/global/styles.dart';
import 'package:pokedex_test/features/pokedex/data/models/pokemon_short_model.dart';
import 'package:pokedex_test/features/pokedex/presentation/pages/pokemon_detail_page.dart';
import 'package:pokedex_test/features/pokedex/presentation/widgets/image_pokemon.dart';

class PokemonShortCard extends StatelessWidget {
  final PokemonShortModel pokemon;
  const PokemonShortCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, PokemonDetailPage.route,
          arguments: pokemon.id),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text("#${pokemon.id}", style: const SubtitleStyle()),
            ),
            ImagePokemon(pokemonId: pokemon.id),
            Text(pokemon.name, style: const TitleStyle()),
          ],
        ),
      )),
    );
  }
}
