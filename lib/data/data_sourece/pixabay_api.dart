import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app/data/data_sourece/result.dart';

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '20240868-830266ae559e89e75f1c2c836';

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client?.get(Uri.parse(
          '${baseUrl}/?key=${key}&q=${query}&image_typephoto=&pretty=true'));

      Map<String, dynamic> jsonResult = jsonDecode(response!.body);
      Iterable hits = jsonResult['hits'];

      return Result.success(hits);
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
