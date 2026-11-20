import 'package:material_ui/material_ui.dart';

class AppSettings extends ChangeNotifier {
  bool darkMode = false;
  Color seedColor = Colors.deepPurple;

  void setDarkMode(bool v) {
    darkMode = v;
    notifyListeners();
  }

  void setSeedColor(Color c) {
    seedColor = c;
    notifyListeners();
  }
}

final appSettings = AppSettings();
