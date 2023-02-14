import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search_app/ui/home_view_model.dart';
import 'package:image_search_app/ui/widget/photo_widget.dart';
import 'package:provider/provider.dart';

import '../data/pixabay_api.dart';
import '../model/Photo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final viewModel = PhotoProvider.of(context).viewModel;
    // final viewModel = Provider.of<HomeViewModel>(context);

    /// watch 로 감싸면서 전체 빌드가 다시 되면서 성능 이슈가 생길 수 있음
    /// Consumer 로 사용하여 해결
    /// 그러나 watch 사용하는 것도 나쁘지 않다.
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          '이미지 검색 앱',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () async {
                          // viewModel.fetch(_controller.text);

                          /// context.read : 한번만 읽을 때 사용
                          context.read<HomeViewModel>().fetch(_controller.text);
                        },
                        icon: const Icon(Icons.search)),
                    border: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.0))))),
          ),
          // StreamBuilder<List<Photo>>(
          //     stream: viewModel.photoStream,
          //     builder: (context, snapshot) {
          //       if (!snapshot.hasData) {
          //         return const CircularProgressIndicator();
          //       }
          //       final photos = snapshot.data!;
          //       return Expanded(
          //         child: GridView.builder(
          //             padding: const EdgeInsets.all(16),
          //             itemCount: photos.length,
          //             gridDelegate:
          //                 const SliverGridDelegateWithFixedCrossAxisCount(
          //                     crossAxisCount: 2,
          //                     crossAxisSpacing: 16,
          //                     mainAxisSpacing: 16),
          //             itemBuilder: (context, index) {
          //               final photo = photos[index];
          //               return PhotoWidget(
          //                 photo: photo,
          //                 api: PixabayApi(),
          //               );
          //               // return Container();
          //             }),
          //       );
          //     })
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: viewModel.photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final photo = viewModel.photos[index];
                  return PhotoWidget(
                    photo: photo,
                    api: PixabayApi(),
                  );
                  // return Container();
                }),
          )
          // Consumer<HomeViewModel>(
          //   builder: (_, viewModel, child) {
          //     return Expanded(
          //       child: GridView.builder(
          //           padding: const EdgeInsets.all(16),
          //           itemCount: viewModel.photos.length,
          //           gridDelegate:
          //               const SliverGridDelegateWithFixedCrossAxisCount(
          //                   crossAxisCount: 2,
          //                   crossAxisSpacing: 16,
          //                   mainAxisSpacing: 16),
          //           itemBuilder: (context, index) {
          //             final photo = viewModel.photos[index];
          //             return PhotoWidget(
          //               photo: photo,
          //               api: PixabayApi(),
          //             );
          //             // return Container();
          //           }),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
