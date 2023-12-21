import 'dart:convert';
import 'package:flutter_examen1/models/departement.model.dart';
import 'package:http/http.dart';

class DepartementService {

  static Future<DepartementList?> getDepartements(String codeRegion) async {
     String departementsUrl = "https://geo.api.gouv.fr/regions/$codeRegion/departements";
     try {
       final Response response = await get(Uri.parse(departementsUrl), headers: {
        "Accept": "application/json"
       });
       if (response.statusCode == 200) {
         if(response.body.isNotEmpty) {
          final jsonResponse = json.decode(response.body); // maybe used jsonDecode()
          final DepartementList departements = DepartementList.fromJson(jsonResponse);
          if (departements.departements.isNotEmpty) {
            return departements;
          } else {
            return null;
          }
         } else {
          return null;
         }
       } else {
          throw Exception('Impossible de charger les départements1');
       }
     } catch (e) {
       print(e.toString());
       throw Exception('Impossible de charger les départements2');
     }
  }
}