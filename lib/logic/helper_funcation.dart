String replaceUrlValueFromMap(
    {required String url, required Map<String, dynamic> map}) {
  if (url.isEmpty) {
    return "http://www.google.com/123/hello/456";
  } else {
    try {
      for (var i = 0; i < map.keys.length; i++) {
        url = url.replaceFirst(
            "{" + map.keys.elementAt(i) + "}", map.values.elementAt(i));
      }
      if (url.contains("{") || url.contains("}")) {
        return url;
      } else {
        return url;
      }
    } catch (e) {
      throw Exception("There is An Issue With Map type");
    }
  }
}
