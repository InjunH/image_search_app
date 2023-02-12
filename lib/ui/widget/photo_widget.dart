import 'package:flutter/material.dart';
import 'package:image_search_app/data/pixabay_api.dart';

import '../../model/Photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;
  final PixabayApi api;

  const PhotoWidget({super.key, required this.photo, required this.api});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(photo.previewURL),
            )));
  }
}
