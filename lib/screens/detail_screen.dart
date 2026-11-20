import 'package:material_ui/material_ui.dart';

import '../game.dart';

class DetailScreen extends StatelessWidget {
  final Game game;
  const DetailScreen({super.key, required this.game});

  Widget _row(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: value),
        ])),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(game.title, overflow: TextOverflow.ellipsis)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              game.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) => const SizedBox(
                height: 150,
                child: Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(game.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          _row('Worth', game.worth),
          _row('Type', game.type),
          _row('Platforms', game.platforms),
          _row('Published', game.publishedDate),
          _row('Ends', game.endDate),
          _row('Users claimed', '${game.users}'),
          const Divider(height: 24),
          Text('Description', style: Theme.of(context).textTheme.titleMedium),
          Text(game.description),
          const SizedBox(height: 12),
          Text('Instructions', style: Theme.of(context).textTheme.titleMedium),
          Text(game.instructions),
        ],
      ),
    );
  }
}
