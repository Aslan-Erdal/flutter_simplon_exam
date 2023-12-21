import 'package:flutter/material.dart';
import 'package:flutter_examen1/components/commune_lister.dart';
import 'package:flutter_examen1/models/departement.model.dart';
import 'package:flutter_examen1/models/commune.model.dart';
import 'package:flutter_examen1/services/commune_service.dart';

class CommunePage extends StatefulWidget {
  const CommunePage({super.key, required this.departement});

  final Departement departement;

  @override
  State<CommunePage> createState() => _CommunePageState();
}

class _CommunePageState extends State<CommunePage> {
  late Future<CommuneList?> communes;

  @override
  void initState() {
    super.initState();
    loadCommunes(widget.departement.code);
  }

  void loadCommunes(String codeDepartement) {
    setState(() {
      communes = CommuneService.getCommunes(codeDepartement);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CommuneList?>(
        future: communes,
        builder: (context, snapshot) {
          // les données sont arrivés sans erreurs;
          if (snapshot.hasData) {
            // La request a provoqué une erreur;
            List<Commune> communes = snapshot.data!.communes;
            return Scaffold(
              appBar: AppBar(
                bottom: PreferredSize(
                    preferredSize: const Size(double.infinity, 150),
                    child: Stack(children: [
                      Container(
                          width: double.infinity,
                          height: 150,
                          color: Colors.blue[50],
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Le département: ${widget.departement.nom}(${widget.departement.code}), compte ${communes.length} communes.",
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              const Text(
                                "Cliquez sur l'une des communes suivantes pour en savoir plus",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )),
                    ])),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                iconTheme: const IconThemeData(color: Colors.white),
                title: Text(
                  "Département: ${widget.departement.nom}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              body: CommuneLister(
                communes: communes,
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
