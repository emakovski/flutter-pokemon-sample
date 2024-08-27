import 'dart:ui';

import 'package:flutter/material.dart';

class Utils {
  static String capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  static double toKg(int value) {
    return value / 10;
  }

  static Color getTypeColor(String type) {
    switch (type) {
      case 'bug':
        return const Color(0xFFA8B820);
      case 'dark':
        return const Color(0xFF705848);
      case 'dragon':
        return const Color(0xFF7038F8);
      case 'electric':
        return const Color(0xFFF8D030);
      case 'fairy':
        return const Color(0xFFEE99AC);
      case 'fighting':
        return const Color(0xFFC03028);
      case 'fire':
        return const Color(0xFFF08030);
      case 'flying':
        return const Color(0xFFA890F0);
      case 'ghost':
        return const Color(0xFF705898);
      case 'grass':
        return const Color(0xFF78C850);
      case 'ground':
        return const Color(0xFFE0C068);
      case 'ice':
        return const Color(0xFF98D8D8);
      case 'normal':
        return const Color(0xFFA8A878);
      case 'poison':
        return const Color(0xFFA040A0);
      case 'psychic':
        return const Color(0xFFF85888);
      case 'rock':
        return const Color(0xFFB8A038);
      case 'steel':
        return const Color(0xFFB8B8D0);
      case 'water':
        return const Color(0xFF6890F0);
      case 'unknown':
        return const Color(0xFF808080);
      case 'shadow':
        return const Color(0xFF000000);
      default:
        return Colors.white;
    }
  }
}
