import 'package:flutter/material.dart';
import 'package:flutter_examen1/models/departement.model.dart';
import 'package:flutter_examen1/pages/commune_page.dart';

class DepartementLister extends StatelessWidget {
  const DepartementLister({super.key, required this.departements});

  final List<Departement> departements;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: departements.length,
        itemBuilder: (context, index) {
          Departement departement = departements[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              // You can customize Card properties here
              child: ListTile(
                title: Text(departement.nom),
                subtitle: Text("Code du département : ${departement.code}"),
                // You can handle onTap here
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => CommunePage(
                              departement: departement,
                            )),
                  );
                },
              ),
            ),
          );
        });
  }
}
