import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_practice/logic/helper_funcation.dart';

void main() {
  test("intro to test", () {
    expect(1 + 1, 2);
  });

  group("test replcament function", () {
    test("case 1 : function with all valid parameters", () {
      Map<String, String> map = {"token": "123", "apikey": "456"};
      String url = "http://www.google.com/{token}/hello/{apikey}";
      String finalUrl = "http://www.google.com/123/hello/456";
      url = replaceUrlValueFromMap(map: map, url: url);

      expect(url, finalUrl);
    });

    test("case 2 : key not found", () {
      Map<String, String> map = {"token": "123", "apike": "456"};
      String url = "http://www.google.com/{token}/hello/{apikey}";
      String finalUrl = "http://www.google.com/123/hello/{apikey}";

      url = replaceUrlValueFromMap(map: map, url: url);

      expect(url, finalUrl);
    });

    test("case 3 : url not found", () {
      Map<String, String> map = {"token": "123", "apikey": "456"};
      String url = "";
      String finalUrl = "http://www.google.com/123/hello/456";

      url = replaceUrlValueFromMap(map: map, url: url);

      expect(url, finalUrl);
    });

    test("case 4 : keys with differnt type", () {
      Map<String, dynamic> map = {"token": "123", "apikey": 456};
      String url = "http://www.google.com/{token}/hello/{apikey}";
      String finalUrl = "http://www.google.com/123/hello/456";

      try {
        url = replaceUrlValueFromMap(map: map, url: url);
      } catch (e) {
        expect(
          e,
          isA<Exception>(),
        );
      }
    });
  });
}
