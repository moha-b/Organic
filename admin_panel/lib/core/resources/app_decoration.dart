part of 'resources.dart';

abstract class AppDecoration {
  static InputDecoration ROUNDEDBORDER(String label) => InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      );
}
