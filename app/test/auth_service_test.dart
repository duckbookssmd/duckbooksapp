import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';

/// Get the URL of the image using isbn
///
/// Return the URL in json provided by __Google Book API__ with [isbn] as param
/// if dont have a image returns '__null__'
///
/// Example:
/// ```dart
///   var a = '9788590379829';
///   var b = 'aIsbnWithoutImage';
///   getHttpImage(a); // 'url_link'
///   getHttpImage(b); // 'null'
/// ```
///
/// Note: [isbn] must by only numbers.
getHttpImage(String isbn) async {

  var url = 'https://www.googleapis.com/books/v1/volumes?q=isbn:$isbn';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode((response.body));
  return (json['totalItems'] == 0 || json['items'][0]['volumeInfo']['imageLinks'].toString() == 'null')
      ? 'null'
      : json['items'][0]['volumeInfo']['imageLinks']['thumbnail'];
}

main() {
  test('Get URL image - success', () async {
    String httpLink = await getHttpImage('9788590379829');
    expect(
      httpLink,
      equals('http://books.google.com/books/content?id=BWSTv8Q48YcC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
    );
  });
  test('Get URL image - Failude', () async {
    String httpLink = await getHttpImage('9788590379829d');
    expect(
      httpLink,
      equals('null'),
    );
  });
}
