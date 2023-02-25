import 'dart:math';

import 'package:image_search_app/domain/repository/photo_api_repository.dart';

import '../../data/data_sourece/result.dart';
import '../model/photo.dart';

class GetPhotosUseCase {
  final PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  Future<Result<List<Photo>>> call(String qurey) async {
    final result = await repository.fetch(qurey);

    return result.when(success: (photos) {
      return Result.success(photos.sublist(0, min(3, photos.length)));
    }, error: (message) {
      return Result.error(message);
    });
  }
}
