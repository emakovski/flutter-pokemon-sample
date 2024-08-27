import 'package:flutter/material.dart';

class PreviousNextButton extends StatelessWidget {
  final bool next;
  final String label;
  final Function onTap;
  const PreviousNextButton(
      {super.key, required this.next, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      child: Row(
        children: [
          if (!next) ...[const Icon(Icons.arrow_back_ios, color: Colors.black38)],
          Text(
            label,
            style: const TextStyle(color: Colors.black38),
          ),
          if (next) ...[const Icon(Icons.arrow_forward_ios, color: Colors.black38)]
        ],
      ),
    );
  }
}
