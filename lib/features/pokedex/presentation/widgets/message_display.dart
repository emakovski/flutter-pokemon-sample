import 'package:flutter/material.dart';
import 'package:pokedex_test/core/global/styles.dart';

class MessageDisplay extends StatelessWidget {
  final String message;
  final bool showRechargeIcon;
  const MessageDisplay({
    super.key,
    required this.message,
    this.showRechargeIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TitleStyle(),
        ),
      ],
    );
  }
}
