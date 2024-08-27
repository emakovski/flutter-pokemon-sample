import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_test/core/global/global_variables.dart';
import 'package:pokedex_test/core/global/styles.dart';
import 'package:pokedex_test/core/utils/utils.dart';
import 'package:pokedex_test/features/pokedex/data/models/pokemon_model.dart';
import 'package:pokedex_test/features/pokedex/presentation/widgets/item_type_pokemon.dart';

class HeaderPokemonDetail extends StatelessWidget {
  final PokemonModel pokemon;
  const HeaderPokemonDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Utils.getTypeColor(pokemon.types.first.type.name),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            Utils.capitalize(pokemon.name),
                            style: const TitleStyle(color: Colors.white, size: 26),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "#${pokemon.id}",
                              style: const TitleStyle(color: Colors.white),
                            )),
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: pokemon.types.length,
                              itemBuilder: (_, index) => ItemTypePokemon(
                                  type: pokemon.types[index].type.name)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                  )
                ],
              ),
              Positioned(
                  bottom: 20,
                  child: SvgPicture.network(
                      "${GlobalVariables.imagesPokemon}${pokemon.id}.svg",
                      height: 200)),
            ],
          ),
        ),
      ),
    );
  }
}
