// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:image_search_app/data/photo_api_repository.dart';

import '../model/Photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();

    const baseUrl = 'https://pixabay.com/api/';
    const key = '20240868-830266ae559e89e75f1c2c836';
    final response = await client.get(Uri.parse(
        '${baseUrl}/?key=${key}&q=${query}&image_typephoto=&pretty=true'));

    Map<String, dynamic> jsonResult = jsonDecode(response.body);
    Iterable hits = jsonResult['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
