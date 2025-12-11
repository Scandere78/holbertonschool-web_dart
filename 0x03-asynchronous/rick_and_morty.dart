import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printRmCharacters() async {
  try {
    // 1. Envoyer une requête GET vers l'API Rick & Morty
    final url = Uri.parse("https://rickandmortyapi.com/api/character");
    final response = await http.get(url);

    // 2. Vérifier le statut
    if (response.statusCode != 200) {
      print("error caught: HTTP ${response.statusCode}");
      return;
    }

    // 3. Parser le JSON
    final data = jsonDecode(response.body);

    // 4. Récupérer la liste des personnages
    final List characters = data["results"];

    // 5. Afficher tous les noms
    for (var character in characters) {
      print(character["name"]);
    }
  } catch (e) {
    print("error caught: $e");
  }
}
