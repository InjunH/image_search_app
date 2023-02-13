import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:image_search_app/data/pixabay_api.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Pixabay 데이터를 잘 가져와야 한다.', () async {
    // final mockClient = MockClient((request) async {
    //   if (request.url.toString() ==
    //       'https://pixabay.com/api/?key=20240868-830266ae559e89e75f1c2c836&q=iphone&image_typephoto=&pretty=true') {
    //     return Response(fakeData, 200);
    //   }
    //   return Response('error', 400);
    // });

    // final api = PixabayApi(client: mockClient);

    // final result = await api.fetch('iphone');

    // expect(result.first.id, 2681039);
    // expect(result.length, 20);
  });
}
