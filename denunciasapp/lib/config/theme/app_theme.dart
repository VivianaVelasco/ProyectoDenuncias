import 'package:flutter/material.dart';

const Color _customColor = Color.fromRGBO(115, 197, 234, 1);

List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.lightBlue,
  Colors.green,
  Colors.orange
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 2})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            "Color ust be between 0 and ${_colorThemes.length}");

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        brightness: Brightness.light);
  }
}
