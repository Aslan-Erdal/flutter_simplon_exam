class Commune {
  Commune({
    required this.nom,
    required this.code,
    required this.codeDepartement,
    required this.siren,
    required this.codeEpci,
    required this.codeRegion,
    required this.codesPostaux,
    required this.population,
  });

  final String nom;
  final String code;
  final String codeDepartement;
  final String siren;
  final String? codeEpci;
  final String codeRegion;
  final List<String> codesPostaux;
  final int population;

// factory: permet de recurer a partir de json fournie des obkets de type product;
  factory Commune.fromJson(Map<String, dynamic> json) {
    return Commune(
      nom: json['nom'],
      code: json['code'],
      codeDepartement: json['codeDepartement'],
      siren: json['siren'],
      codeEpci: json['codeEpci'],
      codeRegion: json['codeRegion'],
      codesPostaux:
          (json['codesPostaux'] as List).map((e) => e as String).toList(),
      population: json['population'],
    );
  }

// getter;
  String get getNom => nom;
  String get getCode => code;
  String get getCodeDepartement => codeDepartement;
  String get getSiren => siren;
  String? get getCodeEpci => codeEpci;
  String get getCodeRegion => codeRegion;
  List<String> get getCodesPostaux => codesPostaux;
  int get getPopulationNumber => population;
}

class CommuneList {
  // constructor;
  CommuneList({
    required this.communes,
  });

// prppriété requise par le constructor;
  final List<Commune> communes;

  factory CommuneList.fromJson(List<dynamic> parseJson) {
    List<Commune> communes = <Commune>[];
    communes = parseJson.map((p) => Commune.fromJson(p)).toList();
    return CommuneList(communes: communes);
  }
}
