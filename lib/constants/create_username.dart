String createUsername(String text) {
  String removePlaksha = text.substring(0, text.indexOf('@'));
  String trimmedString = removePlaksha.replaceAll(".", "");
  return trimmedString;
}