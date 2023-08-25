import 'package:flutter/material.dart';

class Complaint extends StatelessWidget {
  final String text;

  const Complaint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final colorTheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          height: 100,
          width: (size.width * 0.90),
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
