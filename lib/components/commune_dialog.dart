import 'package:flutter/material.dart';
import 'package:flutter_examen1/models/commune.model.dart';

class CommuneDialog extends StatelessWidget {
  const CommuneDialog({super.key, required this.commune});

  final Commune commune;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Détails de la commune",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text("Nom: ${commune.nom}"),
          Text("Code: ${commune.code}"),
          Text("CodeDep: ${commune.codeDepartement}"),
          Text("Siren: ${commune.siren}"),
          Text("Code EPCI: ${commune.codeEpci}"),
          Text("Population: ${commune.population}"),
          Text("CodesPostaux: ${commune.codesPostaux.join(', ')}"),
        ],
      ),
      actions: [
        ElevatedButton(
          child: const Text("Fermer"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
