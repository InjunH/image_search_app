import 'package:flutter/material.dart';
import 'package:image_search_app/data/data_sourece/pixabay_api.dart';
import 'package:image_search_app/data/repository/photo_api_repository_impl.dart';
import 'package:image_search_app/domain/repository/photo_api_repository.dart';
import 'package:image_search_app/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_app/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'presentation/home/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: PhotoProvider(
      //     viewModel: HomeViewModel(PixabayApi()), child: const HomeScreen()),
      /// Provider : 변경을 감지할 수 없다.
      // home: Provider(
      //     create: (_) => HomeViewModel(PixabayApi()),
      //     child: const HomeScreen()),
      /// ChangeNotifierProvider : 변경을 감지할 수 있다.
      home: ChangeNotifierProvider(
          create: (_) => HomeViewModel(GetPhotosUseCase(
              PhotoApiRepositoryImpl(PixabayApi(http.Client())))),
          child: const HomeScreen()),
    );
  }
}
