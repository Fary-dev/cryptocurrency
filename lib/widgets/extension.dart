extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
// final replaced = myString.replaceFirst(RegExp('e'), '*');

extension ReplacedStringExtension on String {
  String replace() {
    return replaceAll(RegExp('-'), ' ');
  }
}