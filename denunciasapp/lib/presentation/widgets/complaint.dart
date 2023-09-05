import 'package:denunciasapp/domains/entities/denuncia.dart';
import 'package:flutter/material.dart';

class Complaint extends StatelessWidget {
  final Denuncia denuncia;

  const Complaint({super.key, required this.denuncia});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final colorTheme = Theme.of(context).colorScheme;
    return GestureDetector(
      child: Column(
        children: [
          Container(
            height: 150,
            width: (size.width * 0.90),
            decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: ListTile(
                title: Text(
                  denuncia.title,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      denuncia.motivo.name,
                    ),
                    Text(denuncia.parroquia.name),
                    Text(
                      denuncia.description,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
