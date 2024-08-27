import 'package:flutter/material.dart';
import 'package:pokedex_test/core/global/styles.dart';
import 'package:pokedex_test/core/utils/utils.dart';

class ItemTypePokemon extends StatelessWidget {
  final String type;
  const ItemTypePokemon({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.4)),
      child: Center(
        child: Text(
          Utils.capitalize(type),
          style: const TitleStyle(size: 16, color: Colors.white),
        ),
      ),
    );
  }
}
