import 'package:image_search_app/data/data_sourece/result.dart';

import '../model/photo.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String qurey);
}
