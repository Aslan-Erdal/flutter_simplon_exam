import 'package:flutter/material.dart';
import 'package:flutter_examen1/models/commune.model.dart';

class CommuneDialog extends StatelessWidget {
  const CommuneDialog({super.key, required this.commune});

  final Commune commune;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // Retrieve the text the that user has entered by using the
      // TextEditingController.
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Détails de la commune",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("Nom: ${commune.nom}"),
          Text("Code: ${commune.code}"),
          Text("CodeDep: ${commune.codeDepartement}"),
          Text("Siren: ${commune.siren}"),
          Text("Code EPCI: ${commune.code}"),
          Text("Population: ${commune.codesPostaux.join(', ')}"),
          Text("CodesPostaux: ${commune.code}"),
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
