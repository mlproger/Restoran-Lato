import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

fetch(String url) {
  var client = http.Client();
  return client.get(Uri.parse(url));
}
