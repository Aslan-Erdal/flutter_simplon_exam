class Region {
  Region({required this.nom, required this.iso, required this.code});

  final String nom;
  final String iso;
  final String code;

// getter;
  String get getNom => nom;
  String get getIso => iso;
  String get getCode => code;
}
