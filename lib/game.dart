import 'dart:convert';

import 'package:http/http.dart' as http;

class Game {
  final int id;
  final String title;
  final String worth;
  final String thumbnail;
  final String image;
  final String description;
  final String instructions;
  final String url;
  final String type;
  final String platforms;
  final String endDate;
  final String publishedDate;
  final int users;

  Game.fromJson(Map<String, dynamic> j)
      : id = j['id'] ?? 0,
        title = j['title'] ?? '',
        worth = j['worth'] ?? 'N/A',
        thumbnail = j['thumbnail'] ?? '',
        image = j['image'] ?? '',
        description = j['description'] ?? '',
        instructions = j['instructions'] ?? '',
        url = j['open_giveaway_url'] ?? '',
        type = j['type'] ?? '',
        platforms = j['platforms'] ?? '',
        endDate = j['end_date'] ?? 'N/A',
        publishedDate = j['published_date'] ?? '',
        users = j['users'] ?? 0;
}

Future<List<Game>> fetchGames() async {
  final res =
      await http.get(Uri.parse('https://www.gamerpower.com/api/giveaways'));
  if (res.statusCode != 200) {
    throw Exception('Server returned ${res.statusCode}');
  }
  final list = jsonDecode(res.body) as List;
  return list.map((e) => Game.fromJson(e as Map<String, dynamic>)).toList();
}
