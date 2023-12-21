import 'package:flutter/material.dart';
import 'package:flutter_examen1/components/departement_lister.dart';
import 'package:flutter_examen1/models/departement.model.dart';
import 'package:flutter_examen1/models/region.model.dart';
import 'package:flutter_examen1/services/departement_service.dart';

class DepartementPage extends StatefulWidget {
  const DepartementPage({super.key, required this.region});

//   final String codeRegion;
  final Region region;

  @override
  State<DepartementPage> createState() => _DepartementPageState();
}

class _DepartementPageState extends State<DepartementPage> {
  late Future<DepartementList?> departements;

  @override
  void initState() {
    super.initState();
    loadDepartement(widget.region.code);
  }

  void loadDepartement(String codeRegion) {
    setState(() {
      departements = DepartementService.getDepartements(codeRegion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DepartementList?>(
        future: departements,
        builder: (context, snapshot) {
          // les données sont arrivés sans erreurs;
          if (snapshot.hasData) {
            // La request a provoqué une erreur;
            List<Departement> departements = snapshot.data!.departements;
            return Scaffold(
              appBar: AppBar(
                bottom: PreferredSize(
                    preferredSize: const Size(double.infinity, 150),
                    child: Stack(children: [
                      Container(
                          width: double.infinity,
                          height: 150,
                          color: Colors.blue[50],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "La région ${widget.region.nom}(${widget.region.code}) compte ${departements.length} départements.",
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Cliquez sur l'un des départements pour en savoir plus",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ])),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                iconTheme: const IconThemeData(color: Colors.white),
                title: Text(
                  "Région: ${widget.region.nom}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              body: DepartementLister(
                departements: departements,
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
