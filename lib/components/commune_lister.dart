import 'package:flutter/material.dart';
import 'package:flutter_examen1/components/commune_dialog.dart';
import 'package:flutter_examen1/models/commune.model.dart';

class CommuneLister extends StatelessWidget {
  const CommuneLister({super.key, required this.communes});

  final List<Commune> communes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: communes.length,
        itemBuilder: (context, index) {
          Commune commune = communes[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              // You can customize Card properties here
              child: ListTile(
                title: Text(commune.nom),
                subtitle: Text(
                    "Population: ${commune.population}, Cde.Post.: ${commune.codesPostaux.join(', ')}"),
                // You can handle onTap here
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CommuneDialog(commune: commune);
                    },
                  );
                },
              ),
            ),
          );
        });
  }
}
