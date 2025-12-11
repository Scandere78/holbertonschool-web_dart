import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printRmCharacters() async {
  try {
    String? url = 'https://rickandmortyapi.com/api/character';

    while (url != null) {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) {
        throw 'Request failed with status: ${response.statusCode}';
      }

      final data = jsonDecode(response.body);
      final results = data['results'];

      if (results is List) {
        for (var character in results) {
          print(character['name']);
        }
      }

      url = data['info']['next'];
    }
  } catch (e) {
    print('error caught: $e');
  }
}
