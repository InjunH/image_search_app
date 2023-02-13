import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app/data/photo_api_repository.dart';
import 'package:image_search_app/data/pixabay_api.dart';
import 'package:image_search_app/model/Photo.dart';
import 'package:image_search_app/ui/home_view_model.dart';

void main() {
  test('Stream이 잘 동작해야 한다.', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());

    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();
    expect(viewModel.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String qurey) async {
    Future.delayed(const Duration(milliseconds: 500));
    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 634572,
    "pageURL":
        "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/ge615f8e23476d03943c2e54bc4d843c1e5b88ed138f6de0cde34a045e6e52ae1eee96727ce1f685fa187c80d60070edd_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g1a5ee97ed0bd85479a83d21b4b09240657cc9ee93c6222958c33e8c1922f158cbc0cd81457b0b5039ed2b13358f01d78380291f2a4ab0df65f5b8f23da28c2b8_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 465371,
    "downloads": 270059,
    "collections": 1258,
    "likes": 2347,
    "comments": 192,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL":
        "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/gd7a0e28e2936ce00634d02d2ab22cdcb040f32c459139327d42cedebf88919439e257241e2744286d0bf5aade84f9a9eda718dd7e04de53b0778576a210bd8f4_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/gac82ca1dc32fe326a3b4be896c7278014dcf6d5ddfea4be1950411314d839e36d6bd021c3d3afab7bf6c9e3f5fe77dfd849cd90d0d37b110d17e98675689bf57_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 672603,
    "downloads": 488534,
    "collections": 1361,
    "likes": 1019,
    "comments": 272,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  },
];
