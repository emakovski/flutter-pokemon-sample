import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_test/core/global/global_variables.dart';

class ImagePokemon extends StatelessWidget {
  final int pokemonId;
  final double width;
  final double height;
  const ImagePokemon({
    super.key,
    required this.pokemonId,
    this.width = 100,
    this.height = 100
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SvgPicture.network(
          "${GlobalVariables.imagesPokemon}$pokemonId.svg",
          width: width,
        height: height,
      ),
    );
  }
}
