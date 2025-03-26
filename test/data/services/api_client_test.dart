import 'package:flutter_mvvm/data/services/api_client.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';
import 'package:flutter_mvvm/utils/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ApiClient client;

  setUp(() {
    client = ApiClient();
  });

  group('Should teste [ApiClient]', () {
    test('Should return Result Ok when getTodos()', () async {
      client = ApiClient();
      final result = await client.getTodos();

      expect(result.asOk.value, isA<List<Todo>>());
    });
  });
}
