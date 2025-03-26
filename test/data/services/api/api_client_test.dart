import 'package:flutter_mvvm/data/services/api/api_client.dart';
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
      //? Arrange
      //! Act
      final result = await client.getTodos();

      //* Assert
      expect(result.asOk.value, isA<List<Todo>>());
    });

    test('Should create a Todo calling postTodo', () async {
      //? Arrange
      //! Act
      final result = await client.postTodo(Todo(id: 0, name: 'Todo 1'));

      expect((result as Ok).value, isA<void>());
    });
  });
}
