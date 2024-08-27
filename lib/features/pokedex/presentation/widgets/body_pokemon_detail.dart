import 'package:flutter/material.dart';
import 'package:pokedex_test/core/global/styles.dart';
import 'package:pokedex_test/core/utils/utils.dart';
import 'package:pokedex_test/features/pokedex/data/models/pokemon_model.dart';

class BodyPokemonDetail extends StatelessWidget {
  final PokemonModel pokemon;
  const BodyPokemonDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          DataPokemon(
            title: "Height",
            subtitle: "${pokemon.height} mm",
          ),
          DataPokemon(
            title: "Weight",
            subtitle: "${Utils.toKg(pokemon.weight).toStringAsFixed(2)} kg",
          ),
          Row(children: [
            const Expanded(
                child: Text(
              'Abilities',
              style: TitleStyle(color: Colors.cyan, size: 18),
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < pokemon.abilities.length; i++)
                  Text(
                    Utils.capitalize(pokemon.abilities[i].ability.name),
                    style: const SubtitleStyle(),
                  ),
              ],
            )),
          ]),
          const SizedBox(
            height: 20,
          ),
          Row(children: [
            const Expanded(
                child: Text(
              'Types',
              style: TitleStyle(color: Colors.cyan, size: 18),
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < pokemon.types.length; i++)
                  Text(
                    Utils.capitalize(pokemon.types[i].type.name),
                    style: const SubtitleStyle(),
                  ),
              ],
            )),
          ]),
        ],
      ),
    ));
  }
}

class DataPokemon extends StatelessWidget {
  final String title;
  final String subtitle;
  const DataPokemon({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: const TitleStyle(color: Colors.cyan, size: 18),
          )),
          Expanded(
              child: Text(
            subtitle,
            style: const SubtitleStyle(),
          )),
        ],
      ),
    );
  }
}
