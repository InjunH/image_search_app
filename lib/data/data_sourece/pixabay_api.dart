import 'dart:convert';

import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '20240868-830266ae559e89e75f1c2c836';

  Future<Iterable> fetch(String query) async {
    final response = await client?.get(Uri.parse(
        '${baseUrl}/?key=${key}&q=${query}&image_typephoto=&pretty=true'));

    Map<String, dynamic> jsonResult = jsonDecode(response!.body);
    Iterable hits = jsonResult['hits'];

    return hits;
  }
}
