// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:image_search_app/data/data_sourece/pixabay_api.dart';
import 'package:image_search_app/domain/repository/photo_api_repository.dart';

import '../../domain/model/Photo.dart';
import 'package:http/http.dart' as http;

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);
  // final api = PixabayApi(http.Client());

  @override
  Future<List<Photo>> fetch(String query) async {
    final result = await api.fetch(query);

    return result.map((e) => Photo.fromJson(e)).toList();
  }
}
