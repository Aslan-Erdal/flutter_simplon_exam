class Departement {
  Departement(
      {required this.nom, required this.code, required this.codeRegion});

  final String nom;
  final String code;
  final String codeRegion;

// factory: permet de recurer a partir de json fournie des obkets de type product;
  factory Departement.fromJson(Map<String, dynamic> json) {
    return Departement(
        nom: json['nom'], code: json['code'], codeRegion: json['codeRegion']);
  }

// getter;
  String get getNom => nom;
  String get getCode => code;
  String get getCodRegion => codeRegion;
}

class DepartementList {
  // constructor;
  DepartementList({
    required this.departements,
  });

// prppriété requise par le constructor;
  final List<Departement> departements;

  factory DepartementList.fromJson(List<dynamic> parseJson) {
    List<Departement> departements = <Departement>[];
    departements = parseJson.map((p) => Departement.fromJson(p)).toList();
    return DepartementList(departements: departements);
  }
}
