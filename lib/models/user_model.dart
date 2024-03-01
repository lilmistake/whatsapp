import 'package:whatsapp/core/services/api_service.dart';

class User {
  final String name;
  final String picture;

  User({required this.name, required this.picture});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name']['first'] + " " + json['name']['last'],
      picture: json['picture']['large'],
    );
  }

  static Future<List<User>> random({int count = 20}) async {
    var response = await getRandomUsers(count);
    if (response == null) {
      return [User(name: "Error Occured", picture: "")];
    }
    return response['results']
        .map<User>((json) => User.fromJson(json))
        .toList();
  }
}
