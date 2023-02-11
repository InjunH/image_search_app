import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search_app/ui/widget/photo_widget.dart';
import 'package:http/http.dart' as http;
import '../model/Photo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Photo> _photos = [];
  final _controller = TextEditingController();

  Future<List<Photo>> fetch(String query) async {
    print(query);
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=20240868-830266ae559e89e75f1c2c836&q=${query}&image_typephoto=&pretty=true'));
    print(response);

    Map<String, dynamic> jsonResult = jsonDecode(response.body);
    Iterable hits = jsonResult['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          print(_controller.text);
                          final photos = await fetch(_controller.text);
                          setState(() {
                            _photos = photos;
                          });
                        },
                        icon: const Icon(Icons.search)),
                    border: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.0))))),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final photo = _photos[index];
                  return PhotoWidget(photo: photo);
                  // return Container();
                }),
          )
        ],
      ),
    );
  }
}
