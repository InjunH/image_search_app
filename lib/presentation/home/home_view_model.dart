import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_app/domain/repository/photo_api_repository.dart';
import 'package:image_search_app/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_app/presentation/home/home_state.dart';
import 'package:image_search_app/presentation/home/home_ui_event.dart';

import '../../data/data_sourece/result.dart';
import '../../domain/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  HomeState _state = HomeState([], false);

  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();

  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  /// 외부에서 수정하지 못하도록 불변 리스트로 타입으로 세팅
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_state.photos);

  HomeViewModel(this.getPhotosUseCase);

  Future<void> fetch(String query) async {
    _state.copyWith(isLoading: true);
    final Result<List<Photo>> result = await getPhotosUseCase.call(query);

    result.when(
      success: (photos) {
        print(photos);
        _state = state.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _state.copyWith(isLoading: false);
    notifyListeners();
  }
}
