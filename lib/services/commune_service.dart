import 'dart:convert';
import 'package:flutter_examen1/models/commune.model.dart';
import 'package:http/http.dart';

class CommuneService {
  static Future<CommuneList?> getCommunes(String codeDepartement) async {
    String communesUrl =
        "https://geo.api.gouv.fr/departements/$codeDepartement/communes";
    print("code Département commune service $codeDepartement");
    try {
      final Response response = await get(Uri.parse(communesUrl),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          final jsonResponse =
              json.decode(response.body); // maybe used jsonDecode()
          final CommuneList communes = CommuneList.fromJson(jsonResponse);
          if (communes.commune.isNotEmpty) {
            return communes;
          } else {
            return null;
          }
        } else {
          return null;
        }
      } else {
        throw Exception('Impossible de charger les communes1');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Impossible de charger les communes2');
    }
  }
}
