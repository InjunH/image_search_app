import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_app/domain/repository/photo_api_repository.dart';
import 'package:image_search_app/domain/use_case/get_photos_use_case.dart';

import '../../data/data_sourece/result.dart';
import '../../domain/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  List<Photo> _photos = [];

  // HomeState _state = HomeState([], false);

  // HomeState get state => _state;

  /// 외부에서 수정하지 못하도록 불변 리스트로 타입으로 세팅
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.getPhotosUseCase);

  Future<void> fetch(String query) async {
    // final result = await repository.fetch(query);
    final Result<List<Photo>> result = await getPhotosUseCase(query);

    result.when(
      success: (photos) {
        // _state = state.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        // _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    notifyListeners();
  }
}
