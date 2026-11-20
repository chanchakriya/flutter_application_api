import 'package:material_ui/material_ui.dart';

import '../settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _colors = <String, Color>{
    'Purple': Colors.deepPurple,
    'Blue': Colors.blue,
    'Green': Colors.green,
    'Orange': Colors.orange,
    'Red': Colors.red,
    'Teal': Colors.teal,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListenableBuilder(
        listenable: appSettings,
        builder: (context, _) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SwitchListTile(
              title: const Text('Dark mode'),
              secondary: const Icon(Icons.dark_mode),
              value: appSettings.darkMode,
              onChanged: appSettings.setDarkMode,
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Color theme',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (final e in _colors.entries)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => appSettings.setSeedColor(e.value),
                        child: CircleAvatar(
                          backgroundColor: e.value,
                          child: appSettings.seedColor == e.value
                              ? const Icon(Icons.check, color: Colors.white)
                              : null,
                        ),
                      ),
                      Text(e.key,
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
