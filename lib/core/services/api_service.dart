import 'dart:convert';
import 'package:http/http.dart' as http;

String endpoint = "https://randomuser.me/api/";

Future<Map<String, dynamic>?> getRandomUsers(int count) {
  return http.get(Uri.parse("$endpoint?results=$count")).then((response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user');
    }
  });
}
