import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_test/core/global/global_variables.dart';
import 'package:pokedex_test/core/global/styles.dart';
import 'package:pokedex_test/features/pokedex/presentation/bloc/pokemons/pokemons_bloc.dart';
import 'package:pokedex_test/features/pokedex/presentation/widgets/previous_next_button.dart';

class HeaderPokemons extends StatelessWidget {
  const HeaderPokemons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Image.asset(
            "${GlobalVariables.images}pokedex-header.png",
          ),
          const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  'Pokedex',
                  style: TitleStyle(size: 30),
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<PokemonsBloc, PokemonsState>(
                      builder: (context, state) {
                    if (state.offset > 0) {
                      return PreviousNextButton(
                        label: 'Previous',
                        next: false,
                        onTap: () =>
                            context.read<PokemonsBloc>().add(const PreviousPage()),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                  BlocBuilder<PokemonsBloc, PokemonsState>(
                      builder: (context, state) {
                    if (state.offset > GlobalVariables.maxPokemons) {
                      return const SizedBox();
                    } else {
                      return PreviousNextButton(
                        label: 'Next',
                        next: true,
                        onTap: () =>
                            context.read<PokemonsBloc>().add(const NextPage()),
                      );
                    }
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
